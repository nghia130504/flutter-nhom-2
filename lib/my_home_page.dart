// lib/my_home_page.dart – DÁN NGUYÊN CÁI NÀY VÀO, CĂN GIỮA ĐẸP HOÀN HẢO!!!
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(  // CĂN GIỮA TOÀN BỘ NỘI DUNG TRÊN MÀN HÌNH
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // CĂN GIỮA THEO CHIỀU DỌC
          crossAxisAlignment: CrossAxisAlignment.center,  // CĂN GIỮA THEO CHIỀU NGANG
          children: const [
            Text(
              "Xin chào mọi người!",
              style: TextStyle(
                color: Colors.red,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
            Icon(
              Icons.heart_broken,
              size: 160,
              color: Colors.red,
            ),
            SizedBox(height: 80),
            Text(
              "Lập trình DĐ - Nhóm 2",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}