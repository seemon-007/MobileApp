import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:Feedme/Page/CartPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:Feedme/Page/cart_provider.dart';
import 'package:Feedme/Page/product_list.dart';
import 'package:Feedme/Page/mapPage.dart'; // สำหรับ MapPage
import 'package:latlong2/latlong.dart'; // สำหรับ LatLng
import 'package:http/http.dart' as http; // สำหรับ API call

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  LatLng _selectedLocation = LatLng(13.7563, 100.5018);
  String _selectedLocationDetails = "กรุงเทพมหานคร, ประเทศไทย";
  String _deliveryMethod = "จัดส่ง"; // ตัวเลือกเริ่มต้นคือ "จัดส่ง"

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    double totalPrice = cartProvider.getTotalPrice();
    double shippingCost = _deliveryMethod == "จัดส่ง" ? 50.0 : 0.0;
    double grandTotal = totalPrice + shippingCost;

    String productName = cartProvider
        .getItems()
        .map((item) => item.productName)
        .join(", ");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Paymant",
          style: TextStyle(color: Colors.white), // เปลี่ยนสีข้อความเป็นสีขาว
        ),
        backgroundColor: Colors.blue, // สีพื้นหลังของ AppBar
        elevation: 0,
        centerTitle: true,// เอาเงาของ AppBar ออก
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📍 แสดงตำแหน่งที่อยู่
            Text("ที่อยู่จัดส่ง", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            InkWell(
              onTap: () async {
                final LatLng? newLocation = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );

                if (newLocation != null) {
                  setState(() {
                    _selectedLocation = newLocation;
                    _selectedLocationDetails =
                    "Lat: ${newLocation.latitude}, Lng: ${newLocation.longitude}";
                  });
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedLocationDetails,
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.location_on, color: Colors.red),
                ],
              ),
            ),

            SizedBox(height: 20),

            // 🎯 ปุ่มเลือกวิธีการรับสินค้า
            Text("วิธีการรับสินค้า", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _deliveryMethod = "จัดส่ง";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _deliveryMethod == "จัดส่ง" ? Colors.blue : Colors.grey[200],
                    foregroundColor: _deliveryMethod == "จัดส่ง" ? Colors.white : Colors.black,
                    minimumSize: Size(150, 50),
                  ),
                  child: Text("จัดส่ง"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _deliveryMethod = "รับที่ร้าน";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _deliveryMethod == "รับที่ร้าน" ? Colors.blue : Colors.grey[200],
                    foregroundColor: _deliveryMethod == "รับที่ร้าน" ? Colors.white : Colors.black,
                    minimumSize: Size(150, 50),
                  ),
                  child: Text("รับที่ร้าน"),
                ),
              ],
            ),

            SizedBox(height: 20),

            Divider(),

            // 📋 สรุปรายการสินค้า
            Text("สรุปคำสั่งซื้อ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ReusableWidget(title: "ราคาสินค้าทั้งหมด", value: totalPrice),
            ReusableWidget(title: "ค่าจัดส่ง", value: shippingCost),
            ReusableWidget(title: "ราคารวม", value: grandTotal),

            Spacer(),

            // 🛒 ปุ่มชำระเงิน
            ElevatedButton(
              onPressed: () async {
                // ฟังก์ชันสำหรับบันทึกข้อมูลไปยัง API
                print("เลือก: $_deliveryMethod");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("ชำระเงิน"),
            ),
          ],
        ),
      ),
    );
  }
}

