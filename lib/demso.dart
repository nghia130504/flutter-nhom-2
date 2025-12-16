// lib/demgio.dart – DÁN NGUYÊN CÁI NÀY VÀO, BÂY GIỜ LÀ ĐẾM SỐ TĂNG DẦN!!!
import 'dart:async';
import 'package:flutter/material.dart';

class DemSoScreen extends StatefulWidget {
  const DemSoScreen({super.key});

  @override
  State<DemSoScreen> createState() => _DemGioScreenState();
}

class _DemGioScreenState extends State<DemSoScreen> {
  int _count = 0; // Số đếm bắt đầu từ 0
  Timer? _timer;
  bool _isRunning = false;

  void _startCounting() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _count++;
      });
    });
  }

  void _stopCounting() {
    _timer?.cancel();
    _isRunning = false;
  }

  void _resetCounting() {
    _stopCounting();
    setState(() {
      _count = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng đếm số", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Số đếm hiện tại",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Text(
              _count.toString(),
              style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startCounting,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Bắt đầu", style: TextStyle(fontSize: 22)),
                ),
                const SizedBox(width: 40),
                ElevatedButton(
                  onPressed: _resetCounting,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Đặt lại", style: TextStyle(fontSize: 22)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}