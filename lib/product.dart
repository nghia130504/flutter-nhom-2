class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.reviewCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      rating: (json['rating']['rate'] ?? 0).toDouble(),
      reviewCount: json['rating']['count'] ?? 0,
    );
  }

  // Giả lập giá gốc để có % giảm giá
  double get oldPrice => price * 1.6;
  int get discountPercent => ((1 - price / oldPrice) * 100).round();
  int get sold => reviewCount * 5; // giả lập đã bán
}