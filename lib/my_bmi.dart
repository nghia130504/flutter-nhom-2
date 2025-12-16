// my_bmi.dart
import 'package:flutter/material.dart';

class BMIHomePage extends StatefulWidget {
  const BMIHomePage({super.key});

  @override
  State<BMIHomePage> createState() => _BMIHomePageState();
} 

class _BMIHomePageState extends State<BMIHomePage> {
  final TextEditingController heightController = TextEditingController(text: "1.7");
  final TextEditingController weightController = TextEditingController(text: "100");

  String bmiResult = "";
  String category = "";

  void calculateBMI() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);

    if (height != null && weight != null && height > 0) {
      double bmi = weight / (height * height);
      String cat = "";

      if (bmi < 18.5) {
        cat = "Gầy";
      } else if (bmi < 25) {
        cat = "Bình thường";
      } else if (bmi < 30) {
        cat = "Thừa cân";
      } else {
        cat = "Béo phì";
      }

      setState(() {
        bmiResult = bmi.toStringAsFixed(2);
        category = cat;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00695C),
        title: const Text(
          "Tính chỉ số BMI",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Chiều cao
            TextField(
              controller: heightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Chiều cao (m)",
                prefixIcon: const Icon(Icons.height, color: Color(0xFF00695C)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 24),

            // Cân nặng
            TextField(
              controller: weightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Cân nặng (kg)",
                prefixIcon: const Icon(Icons.monitor_weight, color: Color(0xFF00695C)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 40),

            // Nút Tính BMI
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: calculateBMI,
                icon: const Icon(Icons.calculate, size: 28),
                label: const Text(
                  "Tính BMI",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00695C),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 60),

            // Kết quả
            if (bmiResult.isNotEmpty) ...[
              Text(
                "Chỉ số BMI: $bmiResult",
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                "Phân loại: $category",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}