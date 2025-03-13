import 'package:flutter/material.dart';

class PembelianPaketPage extends StatelessWidget {
  const PembelianPaketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Pembelian Paket')),
      body: const Center(
        child: Text('Pembelian Paket', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
