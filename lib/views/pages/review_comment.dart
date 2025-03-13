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
      home: ReviewPage(),
    );
  }
}

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFE8C00),
        title: Text('Tenda Camping 4 Orang', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ratings & Reviews (273)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: List.generate(5, (index) {
                        return Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                value: (5 - index) * 0.2,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text('${5 - index}', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text('4.5 ★', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange)),
                      Text('273 Reviews', style: TextStyle(color: Colors.grey)),
                      Text('88% Recommended', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.orange),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Center(
                    child: Text('Write a Review', style: TextStyle(fontSize: 16, color: Colors.orange)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 10),
              Text('Review this product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: List.generate(5, (index) => Icon(Icons.star, color: Colors.orange)),
              ),
              SizedBox(height: 10),
              Text(
                'Review oleh: Isa Siregar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'Saya sangat puas dengan tenda ini! Bahannya sangat kuat dan tahan air, cocok digunakan saat hujan. ' 
                'Tenda ini juga cukup luas untuk 4 orang dan ventilasi udaranya sangat baik, membuat kami tetap nyaman ' 
                'di dalam tenda meskipun di luar cukup dingin. Saya merekomendasikan tenda ini untuk siapa saja yang ingin camping ' 
                'dengan nyaman dan aman.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'assets/tenda_camping.jpg', // Ganti dengan URL gambar tenda asli
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up, color: Colors.orange),
                    onPressed: () {},
                  ),
                  Text('Yes (5)'),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.thumb_down, color: Colors.grey),
                    onPressed: () {},
                  ),
                  Text('No (1)'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
