
import 'package:flutter/material.dart';

class FeedbackHomePage extends StatefulWidget {
  const FeedbackHomePage({super.key});

  @override
 State<FeedbackHomePage> createState() => _FeedbackHomePageState();
}

class _FeedbackHomePageState extends State<FeedbackHomePage> {
  final _nameController = TextEditingController();
  final _feedbackController = TextEditingController();
  int _rating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gửi phản hồi",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Họ tên
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline, color: Colors.red),
                hintText: "Họ tên",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Đánh giá sao
            DropdownButtonFormField<int>(
              value: _rating,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.star_border, color: Colors.red),
                labelText: "Đánh giá (1 - 5 sao)",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
              items: [1, 2, 3, 4, 5]
                  .map((e) => DropdownMenuItem(value: e, child: Text("$e sao")))
                  .toList(),
              onChanged: (val) => setState(() => _rating = val!),
            ),

            const SizedBox(height: 20),

            // Nội dung góp ý
            TextField(
              controller: _feedbackController,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: "Nội dung góp ý",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(Icons.chat_bubble_outline, color: Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Nút Gửi phản hồi — CHỮ TRẮNG 100%
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đã gửi phản hồi thành công!")),
                  );
                },
                icon: const Icon(Icons.send, color: Colors.white), // icon trắng
                label: const Text(
                  "Gửi phản hồi",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // ← CHỮ TRẮNG Ở ĐÂY
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white, // đảm bảo cả icon + chữ đều trắng
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}