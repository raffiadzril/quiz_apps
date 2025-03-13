// ================= wishlist_screen.dart =================
import 'package:flutter/material.dart';
import '../widgets/navbar_widget.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavbarWidget(
        currentIndex: 3,
        onTap: (index) {
          // Handle navigation tap
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Wishlist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF1E1E1E),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: const [
                WishlistItemWidget(
                  imageUrl: 'assets/images/tent_kabiru_consina.png',
                  title: 'Consina Kabiru - Tenda',
                  subtitle: '4 orang',
                  price: 'Rp100,000',
                ),
                WishlistItemWidget(
                  imageUrl: 'assets/images/shoes_mid_eiger.png',
                  title: 'Eiger Mamba MID - Sepatu',
                  subtitle: 'Ukuran : 39',
                  price: 'Rp25,000',
                ),
                WishlistItemWidget(
                  imageUrl: 'assets/images/sleepingbag_e105_naturehike.png',
                  title: 'Nature Hike U150 - Sleeping Bag',
                  subtitle: '(74.8 +11.8)x29.5in',
                  price: 'Rp30,000',
                ),
                WishlistItemWidget(
                  imageUrl: 'assets/images/stove_casterner_consina.png',
                  title: 'Consina Canister - Portable Stove',
                  subtitle: '4 orang',
                  price: 'Rp15,000',
                ),
                WishlistItemWidget(
                  imageUrl: 'assets/images/headlamp_phantom_arei.png',
                  title: 'Arei Phantom L60H - Head Lamp',
                  subtitle: '210 Lumen',
                  price: 'Rp10,000',
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8EB486),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
                child: const Text(
                'Masukan Semua ke Keranjang',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WishlistItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  const WishlistItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network(imageUrl, width: 56, height: 56, fit: BoxFit.cover),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Icon(Icons.chevron_right, size: 20)
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
