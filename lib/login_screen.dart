
import 'package:flutter/material.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _username = TextEditingController(text: "emilys");
  final _password = TextEditingController(text: "emilyspass");
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[900]!, Colors.deepPurple[600]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Icon(Icons.account_circle, size: 120, color: Colors.white),
                SizedBox(height: 40),
                Text("ĐĂNG NHẬP", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 60),
                TextField(controller: _username, style: TextStyle(color: Colors.white), decoration: InputDecoration(filled: true, fillColor: Colors.white24, labelText: "Username", labelStyle: TextStyle(color: Colors.white), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
                SizedBox(height: 20),
                TextField(controller: _password, obscureText: true, style: TextStyle(color: Colors.white), decoration: InputDecoration(filled: true, fillColor: Colors.white24, labelText: "Password", labelStyle: TextStyle(color: Colors.white), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
                SizedBox(height: 50),
                loading
                    ? CircularProgressIndicator(color: Colors.white)
                    : ElevatedButton(
                        onPressed: () async {
                          setState(() => loading = true);
                          
                          await Future.delayed(Duration(seconds: 1));
                          setState(() => loading = false);

                      
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => ProfileScreen()),
                          );
                        },
                        child: Text("ĐĂNG NHẬP", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                          shape: StadiumBorder(),
                        ),
                      ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}