import 'package:flutter/material.dart';

class PengembalianPage extends StatelessWidget {
  const PengembalianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Pengembalian')),
      body: const Center(
        child: Text('Pengembalian', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
