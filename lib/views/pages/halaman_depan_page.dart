import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HalamanDepanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search Camping Equipment',
            prefixIcon: Icon(Icons.search, color: Color(0xFFFE8C00)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                children: [
                  ChoiceChip(label: Text('Semua'), selected: true, selectedColor: Color(0xFFFE8C00)),
                  ChoiceChip(label: Text('Ransel'), selected: false),
                  ChoiceChip(label: Text('Alat Masak'), selected: false),
                  ChoiceChip(label: Text('Jaket & Sepatu'), selected: false),
                  ChoiceChip(label: Text('Tenda'), selected: false),
                ],
              ),
            ),
            SectionTitle(title: 'Exclusive Offer'),
            EquipmentList([
              EquipmentItem('Tenda 8 Orang', 'Rp. 60.000/hari', 'assets/tent.png'),
              EquipmentItem('Sepatu Gunung', 'Rp. 30.000/hari', 'assets/boots.png'),
            ]),
            SectionTitle(title: 'Best Selling'),
            EquipmentList([
              EquipmentItem('Matras Camping', 'Rp. 20.000/hari', 'assets/mat.png'),
              EquipmentItem('Kompor Portable', 'Rp. 40.000/hari', 'assets/stove.png'),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFFE8C00),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('See all', style: TextStyle(color: Color(0xFFFE8C00))),
        ],
      ),
    );
  }
}

class EquipmentList extends StatelessWidget {
  final List<EquipmentItem> items;
  EquipmentList(this.items);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: items,
      ),
    );
  }
}

class EquipmentItem extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  EquipmentItem(this.title, this.price, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(imagePath, height: 100, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(price, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}