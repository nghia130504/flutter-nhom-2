class Article {
  final String title;
  final String? description;
  final String? urlToImage;
  final String url;
  final String publishedAt;

  Article({
    required this.title,
    this.description,
    this.urlToImage,
    required this.url,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'Không có tiêu đề',
      description: json['description'],
      urlToImage: json['urlToImage'],
      url: json['url'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}