import 'package:flutter/material.dart';

class EquipmentDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment Detail', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Detail of the equipment will be shown here.', style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}

class RincianItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rincian Item', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  '../../../assets/images/tent.png',
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tenda Camping 4 Orang',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text('Peralatan Camping', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {},
                      ),
                      Text('1', style: Theme.of(context).textTheme.bodyLarge),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    'Rp. 60.000/hari',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              ExpansionTile(
                title: Text('Deskripsi Produk', style: Theme.of(context).textTheme.titleLarge),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                    child: Text(
                      'Tenda camping ini dirancang untuk 4 orang dengan ruang yang luas dan nyaman. Terbuat dari bahan polyester waterproof yang tahan terhadap hujan serta dilengkapi dengan ventilasi udara yang baik untuk menjaga sirkulasi tetap lancar. Cocok untuk digunakan dalam berbagai kondisi cuaca, baik di pegunungan maupun di pantai.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
                ExpansionTile(
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Spesifikasi', style: Theme.of(context).textTheme.titleLarge),
                ),
                children: [
                  Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                    '- Kapasitas: 4 Orang\n- Bahan: Waterproof Polyester\n- Dimensi: 210 x 210 x 130 cm\n- Berat: 2.5 kg\n- Ventilasi: Jendela dengan jaring anti serangga',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                  ),
                  ),
                ],
                ),
              ExpansionTile(
                title: Text('Review', style: Theme.of(context).textTheme.titleLarge),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                    child: Row(
                      children: List.generate(5, (index) => Icon(Icons.star, color: Colors.orange)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                    child: Text(
                      'Sangat nyaman dan berkualitas! Cocok untuk pendakian dan camping keluarga. Mudah dipasang dan sangat ringan untuk dibawa.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFE8C00),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text('Sewa Sekarang', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
