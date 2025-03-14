import 'package:flutter/material.dart';
import 'package:quiz_apps/views/widgets/navbar_widget.dart';

class MonitorPesananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'Monitor Pesanan',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        
        actions: [
          IconButton(
            onPressed: () {
              // Handle refresh action
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Memuat ulang pesanan...')),
              );
            },
            icon: Icon(Icons.refresh, color: Color(0xFFFE8C00)),
          ),
        ],
      ),
            bottomNavigationBar: NavbarWidget(
        currentIndex: 2,
        onTap: (index) {
          // Handle navigation tap
        },
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 5, // Contoh jumlah pesanan
        itemBuilder: (context, index) {
          return _buildOrderCard(
            context,
            orderName: 'Tenda 8 Orang',
            orderStatus: _getRandomStatus(index),
            duration: '3 Hari',
            totalPrice: 'Rp. 180.000',
          );
        },
      ),
    );
  }

  String _getRandomStatus(int index) {
    final statuses = ['Menunggu Konfirmasi', 'Dalam Pengiriman', 'Selesai'];
    return statuses[index % statuses.length];
  }

  Widget _buildOrderCard(
    BuildContext context, {
    required String orderName,
    required String orderStatus,
    required String duration,
    required String totalPrice,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderName,
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildStatusChip(orderStatus),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Durasi: $duration',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Total Harga: $totalPrice',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (orderStatus == 'Menunggu Konfirmasi')
                  ElevatedButton(
                    onPressed: () {
                      // Handle cancel order action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Pesanan dibatalkan.')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'Batalkan Pesanan',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {
                    // Handle view details action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Lihat detail pesanan...')),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFFFE8C00)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Text(
                    'Lihat Detail',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 12,
                      color: Color(0xFFFE8C00),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color? chipColor;
    switch (status) {
      case 'Menunggu Konfirmasi':
        chipColor = Colors.orange;
        break;
      case 'Dalam Pengiriman':
        chipColor = Colors.blue;
        break;
      case 'Selesai':
        chipColor = Colors.green;
        break;
      default:
        chipColor = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: chipColor,
        ),
      ),
    );
  }
}