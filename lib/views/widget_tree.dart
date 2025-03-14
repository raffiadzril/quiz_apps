// File: views/widget_tree.dart
import 'package:flutter/material.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  Widget buildButton(BuildContext context, String title, String routeName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, routeName),
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFE8C00),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz 1: UI")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(context, 'Halaman Depan', '/halaman-depan'),
                buildButton(context, 'Rincian Item', '/rincian-item'),
                buildButton(context, 'Chat', '/chat'),
                buildButton(context, 'Wishlist', '/wishlist'),
                buildButton(context, 'Keranjang & Checkout', '/keranjang-checkout'),
                buildButton(context, 'Pembelian Paket', '/pembelian-paket'),
                buildButton(context, 'Review & Comment', '/review-comment'),
                SizedBox(height: 20),
                Text("Transaksi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                buildButton(context, 'Monitor Pesanan', '/monitor-pesanan'),
                buildButton(context, 'Pengembalian', '/pengembalian'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
