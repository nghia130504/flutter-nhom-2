import 'dart:convert';
import 'dart:io';

class AuthService {
  static const String baseUrl = "https://dummyjson.com/auth";

  Future<Map<String, dynamic>?> login(String username, String password) async {
    final client = HttpClient();
    try {
      final request = await client.postUrl(Uri.parse('$baseUrl/login'));
      request.headers.contentType = ContentType.json;
      request.write(json.encode({'username': username, 'password': password}));
      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        return json.decode(responseBody);
      }
    } catch (e) {
      print("Lỗi login: $e");
    } finally {
      client.close();
    }
    return null;
  }

  Future<Map<String, dynamic>?> getProfile(String token) async {
    final client = HttpClient();
    try {
      final request = await client.getUrl(Uri.parse('$baseUrl/me'));
      request.headers.add('Authorization', 'Bearer $token');
      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        return json.decode(responseBody);
      }
    } catch (e) {
      print("Lỗi lấy profile: $e");
    } finally {
      client.close();
    }
    return null;
  }
}