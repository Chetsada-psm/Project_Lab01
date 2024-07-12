import 'package:flutter/material.dart';
import 'package:flutter_application_1/Student.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Student data;

  DetailPage({required this.data});

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add navigation to settings or relevant action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: [
              Center(
                child: Hero(
                  tag: data.ids,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(data.images),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  data.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('ID Student:', style: TextStyle(fontSize: 16, color: Colors.purple)),
                  subtitle: Text(data.ids, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('Email:', style: TextStyle(fontSize: 16, color: Colors.purple)),
                  subtitle: Text(data.email, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('Info:', style: TextStyle(fontSize: 16, color: Colors.purple)),
                  subtitle: Text(data.info, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('SocialLink:', style: TextStyle(fontSize: 16, color: Colors.purple)),
                  subtitle: InkWell(
                    child: Text(
                      data.SocialLink,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                    onTap: () => _launchURL(data.SocialLink),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Log out', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
