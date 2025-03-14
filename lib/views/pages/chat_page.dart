import 'package:flutter/material.dart';
import 'package:quiz_apps/views/widgets/navbar_widget.dart';

class ChatPage extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {"isUser": true, "text": "Bang, gue baru pertama kali camping, alat apa aja yang gue butuhin biar ga ribet?"},
    {"isUser": false, "text": "Baik, untuk camping pertama kali, Anda memerlukan tenda, matras, sleeping bag, serta alat masak sederhana agar tetap nyaman di alam."},
    {"isUser": true, "text": "Waduh, ribet juga ya. Ga ada yang simpel tapi tetap enak buat dipake?"},
    {
      "isUser": false,
      "text": "Tentu, kami merekomendasikan paket pemula yang sudah termasuk tenda instan, matras lipat, dan kompor portable, sehingga lebih praktis.",
      "images": ["assets/images/tent.png", "assets/images/stove.png", "assets/images/mat.png"]
    },
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
      bottomNavigationBar: NavbarWidget(
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation tap
        },
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
                      // Bubble Chat
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: CustomPaint(
                          painter: _ChatBubblePainter(message['isUser']),
                          child: Container(
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Text(
                              message['text'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      if (message.containsKey('images'))
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            children: message['images'].map<Widget>((image) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      image,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Input Field
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

// Custom Painter for Chat Bubble
class _ChatBubblePainter extends CustomPainter {
  final bool isUser;

  _ChatBubblePainter(this.isUser);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isUser ? Colors.orange[100]! : Colors.grey[200]!
      ..style = PaintingStyle.fill;

    final path = Path();
    if (isUser) {
      path.moveTo(size.width - 10, 0);
      path.lineTo(size.width, 10);
      path.lineTo(size.width, size.height);
      path.lineTo(10, size.height);
      path.lineTo(0, size.height - 10);
      path.lineTo(0, 10);
      path.lineTo(10, 0);
    } else {
      path.moveTo(10, 0);
      path.lineTo(size.width - 10, 0);
      path.lineTo(size.width, 10);
      path.lineTo(size.width, size.height - 10);
      path.lineTo(size.width - 10, size.height);
      path.lineTo(0, size.height);
      path.lineTo(0, 10);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}