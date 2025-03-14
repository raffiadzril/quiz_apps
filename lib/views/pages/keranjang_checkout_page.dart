import 'package:flutter/material.dart';
import 'package:quiz_apps/views/widgets/navbar_widget.dart';

class KeranjangCheckoutPage extends StatefulWidget {
  const KeranjangCheckoutPage({super.key});

  @override
  State<KeranjangCheckoutPage> createState() => _KeranjangCheckoutPageState();
}

class _KeranjangCheckoutPageState extends State<KeranjangCheckoutPage> {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Eiger Mamba MID - Sepatu',
      'size': 'Ukuran 42',
      'price': 25000,
      'quantity': 1,
      'image': '../../../assets/images/shoes_mid_eiger.png',
    },
    {
      'name': 'Consina Kabiru - Tenda',
      'size': '4-5 orang',
      'price': 120000,
      'quantity': 1,
      'image': '../../../assets/images/tent.png',
    },
    {
      'name': 'Kompor Portable',
      'size': 'Persegi',
      'price': 20000,
      'quantity': 1,
      'image': '../../../assets/images/stove.png',
    },
    {
      'name': 'Matras Camping',
      'size': 'Ukuran 180x60cm',
      'price': 20000,
      'quantity': 1,
      'image': '../../../assets/images/mat.png',
    },
  ];
  double _iconOffset = 0.0;

  double getTotalHarga() {
    return items.fold(0, (sum, item) => sum + (item['quantity'] * item['price']));
  }

  void incrementQuantity(int index) {
    setState(() {
      items[index]['quantity']++;
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (items[index]['quantity'] > 1) items[index]['quantity']--;
      else removeItem(index);
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
              itemCount: items.length,
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
                          items[index]['image'],
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index]['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                items[index]['size'],
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
                                      '${items[index]['quantity']}',
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
                              'Rp${(items[index]['quantity'] * items[index]['price']).toString()}',
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
                if (_iconOffset > 400) _iconOffset = 400; // Batas kanan diperbesar
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