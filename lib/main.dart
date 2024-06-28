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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 56, 161, 231)),
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
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
      'assets/images/5.jpg',
      'assets/images/6.jpg',
      'assets/images/7.jpg',
      'assets/images/8.jpg',
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
    bool isHighlighted = name == "นายเจษฏา พบสมัย" && id == "643450323-8";

    return Container(
      padding: const EdgeInsets.all(10),
      color: isHighlighted ? Color.fromARGB(255, 56, 161, 231) : Colors.transparent,
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
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                id,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
