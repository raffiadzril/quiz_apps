import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {"isUser": true, "text": "Bang, gue baru pertama kali camping, alat apa aja yang gue butuhin biar ga ribet?"},
    {"isUser": false, "text": "Baik, untuk camping pertama kali, Anda memerlukan tenda, matras, sleeping bag, serta alat masak sederhana agar tetap nyaman di alam."},
    {"isUser": true, "text": "Waduh, ribet juga ya. Ga ada yang simpel tapi tetap enak buat dipake?"},
    {"isUser": false, "text": "Tentu, kami merekomendasikan paket pemula yang sudah termasuk tenda instan, matras lipat, dan kompor portable, sehingga lebih praktis.", "images": ["assets/tent.png", "assets/stove.png", "assets/mat.png"]},
    {"isUser": true, "text": "Wih, mantap nih! Harganya berapa bang?"},
    {"isUser": false, "text": "Paket pemula ini bisa Anda sewa dengan harga Rp 150.000 per hari. Apakah Anda tertarik untuk menyewa?"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFE8C00),
        title: Row(
          children: [
            CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.store, color: Colors.orange)),
            SizedBox(width: 10),
            Text('Admin Camping'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message['isUser'] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: message['isUser'] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: message['isUser'] ? Colors.orange[100] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message['text'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      if (message.containsKey('images'))
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: message['images'].length,
                            itemBuilder: (context, imgIndex) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      message['images'][imgIndex],
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ketik pesan...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
