import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'HomePage.dart';
import 'register.dart';
import '../Admin/Admin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController customer_idController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController displayText = TextEditingController();

  Future<void> loginUser() async {
    try {
      // Debug: พิมพ์ค่าที่ส่งใน body
      print('customer_id: ${customer_idController.text}');
      print('Password: ${PasswordController.text}');

      final response = await http.post(
        Uri.parse('http://192.168.124.100:3004/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'customer_id': customer_idController.text,
          'Password': PasswordController.text,
        }),
      );

      // Debug: พิมพ์ status code ของการตอบกลับ
      print('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Debug: พิมพ์ response body เพื่อตรวจสอบข้อมูลที่ได้รับ
        print('Response Body: $data');

        final String role = data['role'];

        // Debug: พิมพ์ role ที่ได้
        print('Role: $role');

        setState(() {
          displayText.text = "Login successful!";
        });

        if (role == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LinkPageadmin()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      } else {
        // Debug: พิมพ์ error message เมื่อ login ล้มเหลว
        print('Login failed with status code: ${response.statusCode}');
        setState(() {
          displayText.text = "Invalid username or Password";
        });
      }
    } catch (e) {
      // Debug: พิมพ์ข้อผิดพลาดที่เกิดขึ้น
      print('Error during login request: $e');
      setState(() {
        displayText.text = "Error occurred during login!";
      });
    }
  }

  @override
  void dispose() {
    customer_idController.dispose();
    PasswordController.dispose();
    displayText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // เพิ่มโลโก้ที่นี่
            Image.asset(
              'assets/images/logo2.png', // แก้ไข path ให้ตรงกับโลโก้
              height: 250, // ปรับความสูงของโลโก้
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: customer_idController,
              decoration: InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: PasswordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: loginUser,
              icon: const Icon(Icons.login),
              label: const Text("Login"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterPage()),
                );
              },
              icon: const Icon(Icons.person_add),
              label: const Text("Register"),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: displayText,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
