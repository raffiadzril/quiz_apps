import 'package:flutter/material.dart';
import '../widgets/navbar_widget.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: NavbarWidget(
        currentIndex: 3,
        onTap: (index) {
          // Handle navigation tap
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Wishlist',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E1E1E),
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                WishlistItemWidget(
                  imageUrl: '../../../assets/images/tent_kabiru_consina.png',
                  title: 'Consina Kabiru - Tenda',
                  subtitle: '4 orang',
                  price: 'Rp100.000',
                ),
                WishlistItemWidget(
                  imageUrl: '../../../assets/images/shoes_mid_eiger.png',
                  title: 'Eiger Mamba MID - Sepatu',
                  subtitle: 'Ukuran : 39',
                  price: 'Rp25.000',
                ),
                WishlistItemWidget(
                  imageUrl: '../../../assets/images/sleepingbag_e105_naturehike.png',
                  title: 'Nature Hike U150 - Sleeping Bag',
                  subtitle: '(74.8 +11.8)x29.5in',
                  price: 'Rp30.000',
                ),
                WishlistItemWidget(
                  imageUrl: '../../../assets/images/stove_casterner_consina.png',
                  title: 'Consina Canister - Portable Stove',
                  subtitle: '4 orang',
                  price: 'Rp15.000',
                ),
                WishlistItemWidget(
                  imageUrl: '../../../assets/images/headlamp_phantom_arei.png',
                  title: 'Arei Phantom L60H - Head Lamp',
                  subtitle: '210 Lumen',
                  price: 'Rp10.000',
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFE8C00),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Masukan Semua ke Keranjang',
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Icon(Icons.favorite, color: Color(0xFFFE8C00), size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
