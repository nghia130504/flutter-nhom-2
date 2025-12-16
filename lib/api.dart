import 'package:dio/dio.dart';
import 'product.dart';

class API {
  final Dio _dio = Dio();
  final String _url = 'https://fakestoreapi.com/products';

  Future<List<Product>> getAllProduct() async {
    try {
      final response = await _dio.get(_url);
      
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Lỗi tải dữ liệu: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối: $e');
    }
  }
}

final api = API(); // dùng chung