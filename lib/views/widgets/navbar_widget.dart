import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavbarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    final navItems = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.storefront),
        label: 'Beranda',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'Pesan',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.receipt_long),
        label: 'Transaksi',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Wishlist',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Keranjang',
      ),
    ];

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/halaman-depan');
          break;
        case 1:
          Navigator.pushNamed(context, '/chat');
          break;
        case 2:
          Navigator.pushNamed(context, '/monitor-pesanan');
          break;
        case 3:
          Navigator.pushNamed(context, '/wishlist');
          break;
        case 4:
          Navigator.pushNamed(context, '/keranjang-checkout');
          break;
      }
      onTap(index);
    }

    if (isWideScreen) {
      return Material(
        elevation: 4,
        color: Colors.white,
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              final isSelected = currentIndex == index;
              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      (item.icon as Icon).icon,
                      color: isSelected ? Color(0xFFFE8C00) : Colors.black,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label ?? '',
                      style: TextStyle(
                        color: isSelected ? Color(0xFFFE8C00) : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      );
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onItemTapped,
      selectedItemColor: Color(0xFFFE8C00),
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: navItems,
    );
  }
}
