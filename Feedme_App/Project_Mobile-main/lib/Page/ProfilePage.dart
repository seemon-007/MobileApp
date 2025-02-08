import 'package:flutter/material.dart';
import 'package:Feedme/Page/login.dart';
import 'package:Feedme/utils/BtnPage.dart';
import 'package:Feedme/Page/BasePage.dart';
import 'package:Feedme/utils/Orderhistory/Order_history.dart';
import 'package:Feedme/utils/address/address.dart';
import 'package:Feedme/utils/account_setting.dart'; // ✅ Import ให้ถูกต้อง
import 'package:Feedme/utils/userprofile/userprofile.dart';
import 'package:Feedme/utils/userdata.dart'; // ✅ เช็คให้แน่ใจว่า `userdata.dart` มีอยู่จริง

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> futureUser;
  int customerId = 33; // **🛑 สมมติว่าเป็น ID ที่ล็อกอินอยู่**

  @override
  void initState() {
    super.initState();
    futureUser = UserService().fetchUserById(customerId);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      index: 3,
      body: Scaffold(

        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Colors.blue, // สีพื้นหลังของ AppBar
          elevation: 0, // เอาเงาของ AppBar ออก
          centerTitle: true, // ทำให้ข้อความอยู่ตรงกลาง
        ),
        body: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("เกิดข้อผิดพลาด"));
            } else if (!snapshot.hasData) {
              return Center(child: Text("ไม่พบข้อมูลผู้ใช้"));
            } else {
              User user = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Userprofile(user: user), // ✅ ส่งข้อมูลไปที่ Userprofile

                    ///body
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ///account setting
                          const SizedBox(height: 20),
                          AccountSetting(
                            icon: Icons.home,
                            title: 'ที่อยู่จัดส่ง',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UserAddress(address: user.address)));
                            },
                          ),
                          const SizedBox(height: 10),
                          AccountSetting(
                            icon: Icons.timer,
                            title: 'ประวัติการซื้อของ',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => OrderHistory(customerId: user.customerId)));
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => LoginPage()));
                        },
                        child: const Text('Logout', style: TextStyle(color: Colors.red)),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
