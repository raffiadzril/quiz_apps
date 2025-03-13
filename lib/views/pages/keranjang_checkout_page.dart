import 'package:flutter/material.dart';
import 'package:quiz_apps/views/widgets/navbar_widget.dart';

class KeranjangCheckoutPage extends StatefulWidget {
  const KeranjangCheckoutPage({super.key});

  @override
  State<KeranjangCheckoutPage> createState() => _KeranjangCheckoutPageState();
}

class _KeranjangCheckoutPageState extends State<KeranjangCheckoutPage> {
  final List<int> quantities = List.generate(4, (index) => 1);
  double _iconOffset = 0.0;

  int getTotalHarga() {
    return quantities.fold(0, (sum, qty) => sum + (qty * 25000));
  }

  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) quantities[index]--;
    });
  }

  void removeItem(int index) {
    setState(() {
      quantities.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Keranjang'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      bottomNavigationBar: NavbarWidget(
        currentIndex: 4,
        onTap: (index) {
          // Handle navigation tap
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: quantities.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(index.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => removeItem(index),
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          '../../../assets/images/shoes_mid_eiger.png',
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Eiger Mamba MID - Sepatu',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Ukuran 42',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  _quantityButton(
                                    Icons.remove,
                                    () => decrementQuantity(index),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      '${quantities[index]}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  _quantityButton(
                                    Icons.add,
                                    () => incrementQuantity(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => removeItem(index),
                              child: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 28),
                            Text(
                              'Rp${(quantities[index] * 25000).toString()}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _iconOffset += details.delta.dx;
                if (_iconOffset < 0) _iconOffset = 0; // Biar gak geser ke kiri
                if (_iconOffset > 40) _iconOffset = 40; // Batas kanan
              });
            },
            onHorizontalDragEnd: (_) {
              // Reset ke posisi awal setelah swipe
              setState(() {
                _iconOffset = 0.0;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Transform.translate(
                          offset: Offset(_iconOffset, 0), // ← ICON GESER DI SINI
                          child: const CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.double_arrow, color: Colors.orange, size: 18),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      'Rp${getTotalHarga().toStringAsFixed(0)}',
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
