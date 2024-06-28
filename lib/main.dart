import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> names = [
      "นายชาญณรงค์ แต่งเมือง",
      "นางสาวนภัสสร ดวงจันทร์",
      "นายเจษฏา พบสมัย", 
      "นายศรันย์ ซุ่นเส้ง",
      "นายกมล จันบุตรดี",
      "นายประสิทธิชัย จันทร์สม",
      "นายก้องภพ ตาดี",
      "นางสาวกฤติยา สินโพธิ์",
    ];
    List<String> ids = [
      "643450069-6",
      "643450326-2",
      "643450323-8",
      "643450086-6",
      "643450063-8",
      "643450079-3",
      "643450321-2",
      "643450320-4",
    ];
    List<String> images = [
      'images/1.jpg',
      'images/2.jpg',
      'images/3.jpg',
      'images/4.jpg',
      'images/5.jpg',
      'images/6.jpg',
      'images/7.jpg',
      'images/8.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("List Student"),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return displayNameItem(
            name: names[index],
            id: ids[index],
            image: images[index % images.length],
          );
        },
      ),
    );
  }

  Widget displayNameItem({required String name, required String id, required String image}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                id,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
