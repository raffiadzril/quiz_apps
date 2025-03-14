import 'package:flutter/material.dart';
import 'package:quiz_apps/views/pages/promo_page.dart';
import 'views/widget_tree.dart';
import 'views/pages/halaman_depan_page.dart';
import 'views/pages/rincian_item_page.dart';
import 'views/pages/chat_page.dart';
import 'views/pages/wishlist_page.dart';
import 'views/pages/keranjang_checkout_page.dart';
import 'views/pages/monitor_pesanan_page.dart';
import 'views/pages/pengembalian_page.dart';
import 'views/pages/review_comment.dart';

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
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Gilroy'),
          bodyMedium: TextStyle(fontFamily: 'Gilroy'),
          displayLarge: TextStyle(fontFamily: 'Gilroy'),
          displayMedium: TextStyle(fontFamily: 'Gilroy'),
          displaySmall: TextStyle(fontFamily: 'Gilroy'),
          headlineMedium: TextStyle(fontFamily: 'Gilroy'),
          headlineSmall: TextStyle(fontFamily: 'Gilroy'),
          titleLarge: TextStyle(fontFamily: 'Gilroy'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WidgetTree(),
        '/halaman-depan': (context) => HalamanDepanPage(),
        '/rincian-item': (context) => RincianItemPage(),
        '/chat': (context) => ChatPage(),
        '/review-comment': (context) => ReviewPage(),
        '/wishlist': (context) => const WishlistPage(),
        '/keranjang-checkout': (context) => const KeranjangCheckoutPage(),
        '/pembelian-paket': (context) => const PromoPage(),
        '/monitor-pesanan': (context) => MonitorPesananPage(),
        '/pengembalian': (context) => const PengembalianSewaPage(),
      },
    );
  }
}