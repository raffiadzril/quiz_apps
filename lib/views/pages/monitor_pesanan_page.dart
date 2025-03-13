import 'package:flutter/material.dart';

class MonitorPesananPage extends StatelessWidget {
  const MonitorPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Monitor Pesanan')),
      body: const Center(
        child: Text('Monitor Pesanan', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
