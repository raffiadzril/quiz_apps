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
      home: EquipmentDetailPage(),
    );
  }
}

class RincianItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/tent.png',
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tenda Camping 4 Orang',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.red),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text('Peralatan Camping', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {},
                          ),
                          Text('1', style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Text(
                        'Rp. 60.000/hari',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  ExpansionTile(
                    title: Text('Deskripsi Produk'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Tenda camping untuk 4 orang, berbahan waterproof dengan ventilasi udara yang baik. Cocok untuk semua kondisi cuaca.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Spesifikasi'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          '- Kapasitas: 4 Orang\n- Bahan: Waterproof Polyester\n- Dimensi: 210 x 210 x 130 cm\n- Berat: 2.5 kg',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Review'),
                    children: [
                      Row(
                        children: List.generate(5, (index) => Icon(Icons.star, color: Colors.orange)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Sangat nyaman dan berkualitas! Cocok untuk pendakian dan camping keluarga.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFE8C00),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text('Sewa Sekarang', style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }
}
