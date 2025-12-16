// lib/hotel_list_screen.dart – TẠO FILE MỚI, DÁN NGUYÊN CÁI NÀY VÀO!!!
import 'package:flutter/material.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh Sách Phòng", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Thanh vị trí + ngày
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.grey[100],
            child: Row(
              children: [
                const Icon(Icons.arrow_back),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Xung quanh vị trí hiện tại", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("23 thg 10 – 24 thg 10", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Icon(Icons.search, color: Colors.blue[700]),
              ],
            ),
          ),

          // Nút Sắp xếp / Lọc / Bản đồ
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(onPressed: () {}, icon: const Icon(Icons.swap_vert), label: const Text("Sắp xếp")),
                TextButton.icon(onPressed: () {}, icon: const Icon(Icons.tune), label: const Text("Lọc")),
                TextButton.icon(onPressed: () {}, icon: const Icon(Icons.map), label: const Text("Bản đồ")),
              ],
            ),
          ),

          const Divider(height: 1),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Align(alignment: Alignment.centerLeft, child: Text("757 chỗ nghỉ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ),

          // Danh sách phòng với ảnh thật
          Expanded(
            child: ListView(
              children: [
                hotelCard(
                  name: "Song Huong Hue Boutique",
                  rating: 9.2,
                  reviews: "Tuyệt hảo 34 đánh giá",
                  location: "Cư Chinh · cách bạn 0,9km",
                  rooms: "1 phòng khách sạn: 1 giường",
                  price: "US\$20",
                  imageUrl: "https://ahoyvietnam.com/wp-content/uploads/2025/09/Outdoor-pool-Indochine-Palace-Hue-AhoyVietnam-Featured-scaled.webp",
                ),
                hotelCard(
                  name: "Huế Victory Villa",
                  rating: 8.0,
                  reviews: "Rất tốt 10 đánh giá",
                  location: "Cư Chinh · cách bạn 1,3km",
                  rooms: "1 biệt thự riêng: 3 phòng ngủ",
                  price: "US\$285",
                  imageUrl: "https://images.travelandleisureasia.com/wp-content/uploads/sites/3/2025/03/21122551/Banyan-Tree-Lang-Co-Ocean-view-Pool-Villa.jpg",
                ),
                hotelCard(
                  name: "Huong Giang Boutique",
                  rating: 8.5,
                  reviews: "Tuyệt vời 20 đánh giá",
                  location: "Trung tâm Huế · cách bạn 0,5km",
                  rooms: "1 phòng suite: view sông Hương",
                  price: "US\$150",
                  imageUrl: "https://media.istockphoto.com/id/1390233984/photo/modern-luxury-bedroom.jpg?s=612x612&w=0&k=20&c=po91poqYoQTbHUpO1LD1HcxCFZVpRG-loAMWZT7YRe4=",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget hotelCard({
    required String name,
    required double rating,
    required String reviews,
    required String location,
    required String rooms,
    required String price,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(width: 120, height: 140, color: Colors.grey[300], child: const Icon(Icons.hotel)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.blue[700], borderRadius: BorderRadius.circular(4)),
                        child: Text(rating.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      Text(reviews, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                      Text(location, style: TextStyle(color: Colors.grey[700])),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(rooms, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                      Text("Đã bao gồm thuế và phí", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}