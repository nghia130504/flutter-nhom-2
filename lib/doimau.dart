// lib/doimau.dart – TẠO FILE MỚI, DÁN NGUYÊN CÁI NÀY VÀO!!!
import 'package:flutter/material.dart';
import 'dart:math';

class DoiMauScreen extends StatefulWidget {
  const DoiMauScreen({super.key});

  @override
  State<DoiMauScreen> createState() => _DoiMauScreenState();
}

class _DoiMauScreenState extends State<DoiMauScreen> {
  Color _backgroundColor = Colors.teal; // Màu nền ban đầu

  // Danh sách màu đẹp để đổi ngẫu nhiên
  final List<Color> _colors = [
    Colors.teal,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.red,
    Colors.cyan,
    Colors.amber,
  ];

  void _changeColor() {
    final random = Random();
    setState(() {
      _backgroundColor = _colors[random.nextInt(_colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Color",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: _backgroundColor, // Màu nền thay đổi
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Nhấn nút bên dưới để đổi màu nền",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: _changeColor,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: _backgroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
              ),
              child: const Text(
                "Đổi màu",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}