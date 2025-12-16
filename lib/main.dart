// lib/main.dart – CHỈ CHẠY FILE all_baitap.dart THÔI, ĐẸP HOÀN HẢO!!!
import 'package:flutter/material.dart';
import 'all_baitap.dart';  // Import file all_baitap.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tất cả bài tập - Nhóm 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home:  AllBaiTapPage(),  // Chạy thẳng vào AllBaiTapPage trong all_baitap.dart
    );
  }
}