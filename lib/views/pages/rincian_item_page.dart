import 'package:flutter/material.dart';

class RincianItemPage extends StatelessWidget {
  const RincianItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Rincian Item')),
      body: const Center(
        child: Text('Rincian Item', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
