// lib/my_product.dart
import 'package:flutter/material.dart';
import 'api.dart';
import 'product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});
  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<Product> allProducts = [];
  List<Product> displayProducts = [];
  bool isLoading = true;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final list = await api.getAllProduct();
      setState(() {
        allProducts = list;
        displayProducts = list;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lỗi tải dữ liệu: $e")),
      );
    }
  }

  void searchProduct(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        displayProducts = allProducts;
      } else {
        displayProducts = allProducts.where((product) {
          return product.title.toLowerCase().contains(lowerQuery);
        }).toList();
      }
    });
  }

  // Format tiền Việt Nam không cần package intl
  String formatPrice(double price) {
    final String s = price.toStringAsFixed(0);
    String result = '';
    int count = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      count++;
      result = s[i] + result;
      if (count % 3 == 0 && i > 0) result = '.$result';
    }
    return '$result ₫';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Shop Nhóm 2", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: TextField(
              controller: searchController,
              onChanged: searchProduct,
              decoration: InputDecoration(
                hintText: "Tìm kiếm sản phẩm...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Danh sách sản phẩm
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator(color: Colors.orange))
                : displayProducts.isEmpty
                    ? const Center(child: Text("Không tìm thấy sản phẩm", style: TextStyle(fontSize: 18)))
                    : GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.68,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: displayProducts.length,
                        itemBuilder: (context, index) {
                          final p = displayProducts[index];
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => ProductDetailSheet(product: p, formatPrice: formatPrice),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Ảnh + badge giảm giá
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                        child: Image.network(
                                          p.image,
                                          height: 170,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) return child;
                                            return const SizedBox(
                                              height: 170,
                                              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                                            );
                                          },
                                        ),
                                      ),
                                      if (p.discountPercent > 0)
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Container(
                                            padding: const EdgeInsets.all(6),
                                            decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                            child: Text(
                                              "-${p.discountPercent}%",
                                              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),

                                  // Thông tin
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          p.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 13.5, height: 1.3),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            const Icon(Icons.star, color: Colors.amber, size: 16),
                                            Text(" ${p.rating}", style: const TextStyle(fontSize: 13)),
                                            const Spacer(),
                                            Text(
                                              "Đã bán ${p.sold >= 1000 ? '${(p.sold / 1000).toStringAsFixed(1)}k+' : p.sold}",
                                              style: const TextStyle(fontSize: 11, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        if (p.discountPercent > 0)
                                          Text(
                                            formatPrice(p.oldPrice),
                                            style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough, fontSize: 12),
                                          ),
                                        Text(
                                          formatPrice(p.price),
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

// CHI TIẾT SẢN PHẨM (Bottom Sheet siêu đẹp)
class ProductDetailSheet extends StatelessWidget {
  final Product product;
  final String Function(double) formatPrice;

  const ProductDetailSheet({required this.product, required this.formatPrice, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.93,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Ảnh + nút đóng
          Stack(
            children: [
              Image.network(
                product.image,
                height: 360,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 40,
                left: 12,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 32, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                  style: IconButton.styleFrom(backgroundColor: Colors.black54),
                ),
              ),
            ],
          ),

          // Nội dung
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      Text(" ${product.rating} (${product.reviewCount} đánh giá)", style: const TextStyle(fontSize: 16)),
                      const Spacer(),
                      Text("Đã bán ${product.sold >= 1000 ? '${(product.sold / 1000).toStringAsFixed(1)}k+' : product.sold}"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (product.discountPercent > 0)
                    Text(formatPrice(product.oldPrice), style: const TextStyle(fontSize: 18, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                  Text(formatPrice(product.price), style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.red)),
                  if (product.discountPercent > 0)
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                      child: Text("-${product.discountPercent}% GIẢM SỐC", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  const SizedBox(height: 24),
                  const Text("Mô tả sản phẩm", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(product.description, style: const TextStyle(fontSize: 15.5, height: 1.6)),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),

          // Nút mua hàng cố định
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Đã thêm vào giỏ hàng")));
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Thêm vào giỏ", style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: const EdgeInsets.symmetric(vertical: 16)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Đặt mua thành công!")));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: const EdgeInsets.symmetric(vertical: 16)),
                    child: const Text("Mua ngay", style: TextStyle(fontSize: 17, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}