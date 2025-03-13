import 'package:flutter/material.dart';

class KeranjangCheckoutPage extends StatelessWidget {
  const KeranjangCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Keranjang & Checkout')),
      body: const Center(
        child: Text('Keranjang & Checkout', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
