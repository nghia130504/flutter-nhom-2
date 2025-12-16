// lib/my_bth2.dart – DÁN NGUYÊN CÁI NÀY VÀO, CÓ TIÊU ĐỀ "My Classroom" ĐẸP HOÀN HẢO!!!
import 'package:flutter/material.dart';

class Bth2 extends StatelessWidget {
  const Bth2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 193, 193),
      appBar: AppBar(
        title: const Text(
          "My Classroom",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[800],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          blockCard(
            "XML và ứng dụng - Nhóm 1",
            "2025-2026.1.TIN4583.001",
            58,
            "https://plus.unsplash.com/premium_vector-1720982089651-6fe372b5c1fa?q=80&w=2534&auto=format&fit=crop&ixlib=rb-4.1.0",
          ),
          blockCard(
            "Lập trình ứng dụng cho các thiết bị di động",
            "2025-2026.1.TIN4403.006",
            55,
            "https://images.unsplash.com/photo-1526378722484-bd91ca387e72?auto=format&fit=crop&w=1200&q=60",
          ),
          blockCard(
            "Lập trình ứng dụng cho các thiết bị di động",
            "2025-2026.1.TIN4403.005",
            52,
            "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&q=60",
          ),
          blockCard(
            "Lập trình ứng dụng cho các thiết bị di động",
            "2025-2026.1.TIN4403.004",
            50,
            "https://images.unsplash.com/photo-1485217988980-11786ced9454?auto=format&fit=crop&w=1200&q=60",
          ),
          blockCard(
            "Lập trình ứng dụng cho các thiết bị di động",
            "2025-2026.1.TIN4403.003",
            50,
            "https://images.unsplash.com/photo-1485217988980-11786ced9454?auto=format&fit=crop&w=1200&q=60",
          ),
        ],
      ),
    );
  }

  Widget blockCard(String title, String code, int students, String image) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      code,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$students học viên",
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}