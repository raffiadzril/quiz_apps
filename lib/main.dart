import 'package:flutter/material.dart';
import 'package:quiz_apps/views/pages/promo_page.dart';
import 'views/widget_tree.dart';
import 'views/pages/halaman_depan_page.dart';
import 'views/pages/rincian_item_page.dart';
import 'views/pages/chat_page.dart';
import 'views/pages/wishlist_page.dart';
import 'views/pages/keranjang_checkout_page.dart';
import 'views/pages/pembelian_paket_page.dart';
import 'views/pages/monitor_pesanan_page.dart';
import 'views/pages/pengembalian_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz UI Navigation',
      theme: ThemeData(
        fontFamily: 'Gilroy', // Menggunakan font Gilroy Family
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WidgetTree(),
        '/halaman-depan': (context) => const HalamanDepanPage(),
        '/rincian-item': (context) => const RincianItemPage(),
        '/chat': (context) => const ChatPage(),
        '/wishlist': (context) => const WishlistPage(),
        '/keranjang-checkout': (context) => const KeranjangCheckoutPage(),
        '/pembelian-paket': (context) => const PembelianPaketPage(),
        '/promo': (context) => const PromoPage(),
        '/monitor-pesanan': (context) => const MonitorPesananPage(),
        '/pengembalian': (context) => const PengembalianPage(),
      },
    );
  }
}