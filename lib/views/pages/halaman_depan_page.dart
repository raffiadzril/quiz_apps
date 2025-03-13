import 'package:flutter/material.dart';

class HalamanDepanPage extends StatelessWidget {
  const HalamanDepanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.menu, color: Colors.black),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'cari item',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.person, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter Kategori
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(label: Text('Semua'), selected: true, onSelected: (_) {}),
                FilterChip(label: Text('Ransel'), selected: false, onSelected: (_) {}),
                FilterChip(label: Text('Alat Masak'), selected: false, onSelected: (_) {}),
                FilterChip(label: Text('Jaket & Sepatu'), selected: false, onSelected: (_) {}),
                FilterChip(label: Text('Tenda'), selected: false, onSelected: (_) {}),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(label: Text('Penerangan'), selected: false, onSelected: (_) {}),
                FilterChip(label: Text('Alat Tidur'), selected: false, onSelected: (_) {}),
                FilterChip(label: Text('Lainnya'), selected: false, onSelected: (_) {}),
              ],
            ),


            // Tombol Urutkan
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.sort),
                label: const Text("Urutkan"),
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            // Daftar Item
            const SizedBox(height: 12),
            _buildItemCard(
              image: Icons.image,
              title: 'Tenda 8 orang',
              price: 'Rp. 60.000',
              stok: 'sisa 3',
              desc: 'Tenda dibuat dari bahan xyz yang tahan kecepatan angin xyz',
            ),
            const SizedBox(height: 12),
            _buildItemCard(
              image: Icons.image,
              title: 'Sepatu Gunung',
              price: 'Rp. 30.000',
              stok: 'sisa 10',
              desc: 'Sepatu waterproof, merk XYZ semua ukuran',
            ),

            // Paket Pilihan
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPaketBox(Icons.image, 'Paket Hemat 1'),
                _buildPaketBox(Icons.image, 'Paket Promo A'),
                _buildPaketBox(Icons.image, 'Paket Lengkap'),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transaksi'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Keranjang'),
        ],
      ),
    );
  }

  Widget _buildItemCard({
    required IconData image,
    required String title,
    required String price,
    required String stok,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(image, size: 40),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$title\n$price ($stok)', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaketBox(IconData icon, String title) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 40),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
