import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'article.dart';

class DetailScreen extends StatelessWidget {
  final Article article;
  const DetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Chi tiết bài viết"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            article.urlToImage != null
                ? Image.network(
                    article.urlToImage!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(height: 250, color: Colors.grey[300], child: Icon(Icons.image_not_supported, size: 80)),
                  )
                : Container(height: 250, color: Colors.grey[300], child: Icon(Icons.image, size: 80)),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Ngày đăng: ${article.publishedAt.substring(0, 10)}", style: TextStyle(color: Colors.grey[700])),
                  SizedBox(height: 15),
                  Text(article.description ?? "Không có mô tả.", style: TextStyle(fontSize: 16, height: 1.5)),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: article.url));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Đã copy link bài viết!"), backgroundColor: Colors.green),
                        );
                      },
                      icon: Icon(Icons.copy),
                      label: Text("Copy link bài viết gốc"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: EdgeInsets.symmetric(vertical: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}