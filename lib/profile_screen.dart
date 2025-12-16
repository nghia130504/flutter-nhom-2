
import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.deepPurple[50]!, Colors.white], begin: Alignment.topCenter)),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                CircleAvatar(radius: 80, backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/44.jpg")),
                SizedBox(height: 20),
                Text("Emily Johnson", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                Text("emily.johnson@example.com", style: TextStyle(fontSize: 18, color: Colors.grey[700])),
                SizedBox(height: 40),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        info("Tuổi", "29 tuổi"),
                        info("Giới tính", "Nữ"),
                        info("SĐT", "+84 965-431-302"),
                        info("Ngày sinh", "1996-5-30"),
                        info("Chiều cao", "168 cm"),
                        info("Cân nặng", "56 kg"),
                        info("Mắt", "Green"),
                        info("Tóc", "Blond – Straight"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                      (route) => false,
                    );
                  },
                  icon: Icon(Icons.logout, color: Colors.white),
                  label: Text("ĐĂNG XUẤT", style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget info(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
        ],
      ),
    );
  }
}