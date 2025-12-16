import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hello_screen.dart';
import 'my_home_page.dart';
import 'my_place.dart';
import 'my_bth3.dart';
import 'my_bth2.dart';
import 'hotel_list_screen.dart';
import 'doimau.dart';
import 'demso.dart';
import 'my_form_dangnhap.dart' hide HomeScreen;
import 'my_form_dangki.dart';
import 'my_bmi.dart';
import 'my_phanhoi.dart';
import 'home_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(const AllBaiTapApp());
}

class AllBaiTapApp extends StatelessWidget {
  const AllBaiTapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tất cả bài tập - Nhóm 2',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: AllBaiTapPage(),
    );
  }
}

class AllBaiTapPage extends StatelessWidget {
  AllBaiTapPage({super.key});

  final List<Map<String, Widget Function()>> pages = [
    {'Bài 1 - Hello Screen': () => const HelloScreen()},
    {'Bài 2 - Xin chào mọi người': () => const MyHomePage()},
    {'Bài 3 - My Place': () => const Myplace()},
    {'Bài 4 - Saved Places': () => const Bth3()},
    {'Bài 5 - My Classroom': () => const Bth2()},
    {'Bài 6 - Danh sách phòng': () => const HotelListScreen()},
    {'Bài 7 - Đổi màu': () => DoiMauScreen()},
    {'Bài 8 - Đếm số': () => DemSoScreen()},
    {'Bài 9 - Form đăng nhập': () => const MyForm()},
    {'Bài 10 - Form đăng ký': () => const MyFormDangKi()},
    {'Bài 11 - Tính BMI': () => BMIHomePage()},
    {'Bài 12 - Phản hồi': () => FeedbackHomePage()},
    {'Bài 13 - Tin tức': () => HomeScreen()},
    {'Bài 14 - Login + Profile': () => LoginScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Tất cả bài tập - Nhóm 2',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[700]!, Colors.blue[900]!],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage('https://i.imgur.com/BoN9kdK.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nhóm 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Flutter Mobile',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ...pages.asMap().entries.map((entry) {
              int index = entry.key + 1;
              String title = entry.value.keys.first;
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  child: Text(
                    '$index',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
                title: Text(title),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => entry.value.values.first(),
                    ),
                  );
                },
              );
            }).toList(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.code, color: Colors.green),
              title: const Text('GitHub nhóm'),
              onTap: () async {
                final Uri url =
                    Uri.parse('https://github.com/nghia130504/flutter-nhom-2/tree/main');
                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Không mở được GitHub')),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
                child: Column(
                  children: [
                    const Icon(
                      Icons.flutter_dash,
                      size: 200,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Kéo Drawer bên trái để chọn bài nhé!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.link, size: 26),
                      label: const Text(
                        'Mở GitHub nhóm',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () async {
                        final Uri url = Uri.parse(
                            'https://github.com/nghia130504/flutter-nhom-2/tree/main');
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Không mở được link')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
