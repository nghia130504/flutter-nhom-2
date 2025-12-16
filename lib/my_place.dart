import 'package:flutter/material.dart';

class Myplace extends StatelessWidget {
  const Myplace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(  
        children: [
          block1(),
          block2(),
          block3(),
          block4(),
        ],
      ),
    );
  }


  Widget block1() {
    var src =
        "https://images.unsplash.com/photo-1755899850036-084006cbc1c2?q=80&w=1688&auto=format&fit=crop&ixlib=rb-4.1.0";
    return Image.network(src);
  }


  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Lễ hội Trung Thu",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Huế, Việt Nam",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.red),
          const Text("41"),
        ],
      ),
    );
  }


Widget block3() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // CALL
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.call, color: Colors.blue),
            SizedBox(height: 8),
            Text("CALL", style: TextStyle(color: Colors.blue)),
          ],
        ),

        // ROUTE
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.near_me, color: Colors.blue),
            SizedBox(height: 8),
            Text("ROUTE", style: TextStyle(color: Colors.blue)),
          ],
        ),

        // SHARE
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.share, color: Colors.blue),
            SizedBox(height: 8),
            Text("SHARE", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ],
    ),
  );
}



  Widget block4() {
    var date =
        "Tết Trung thu là một lễ hội truyền thống ở Việt Nam vào đêm Rằm tháng Tám âm lịch, "
        "là dịp để các gia đình sum vầy, trẻ em vui đùa với đèn lồng và bánh trung thu, "
        "với âm thanh trống lân rộn ràng và ánh trăng sáng. Lễ hội mang ý nghĩa đoàn viên, "
        "gắn kết tình thân và gìn giữ nét đẹp văn hóa dân tộc qua các hoạt động như rước đèn, "
        "phá cỗ, và thưởng thức các loại bánh đặc trưng.";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        date,
        style: const TextStyle(fontSize: 16, height: 1.5),
      ),
    );
  }
}
