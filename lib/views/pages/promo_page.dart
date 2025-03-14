import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> promoImages = [
      '../../../assets/images/promob1.png',
      '../../../assets/images/promob2.png',
      '../../../assets/images/promob1.png',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.local_offer, color: Colors.black),
            SizedBox(width: 8),
            Text(
              'Promo Hemat',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: promoImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigasi ke detail promo atau aksi lainnya
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Promo Diklik!')),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 30,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    promoImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}