import 'package:flutter/material.dart';
import 'package:quiz_apps/views/widgets/navbar_widget.dart';

class HalamanDepanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Camping Equipment',
                  hintStyle: TextStyle(fontFamily: 'serif', color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Color(0xFFFE8C00)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.filter_list, color: Color(0xFFFE8C00)),
              onPressed: () {
                // Handle filter button press
              },
            ),
            Text(
              'Urutkan',
              style: TextStyle(
                fontFamily: 'serif',
                color: Color(0xFFFE8C00),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavbarWidget(
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation tap
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Container(
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('../../../assets/images/bg.jpg'), // Replace with your banner image path
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                ),
              ),
              height: 200,
              child: Center(
                child: Text(
                  'zrenCamp',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  _buildChoiceChip('Semua', true),
                  _buildChoiceChip('Ransel', false),
                  _buildChoiceChip('Alat Masak', false),
                  _buildChoiceChip('Jaket & Sepatu', false),
                  _buildChoiceChip('Tenda', false),
                  _buildChoiceChip('Sleeping Bag', false),
                  _buildChoiceChip('Kompor Portable', false),
                  _buildChoiceChip('Matras', false),
                ],
              ),
            ),
            SectionTitle(title: 'Exclusive Offer'),
            EquipmentList([
              EquipmentItem('Tenda 8 Orang', 'Rp. 60.000/hari', 'assets/images/tent.png'),
              EquipmentItem('Sepatu Gunung', 'Rp. 30.000/hari', 'assets/images/boots.png'),
              EquipmentItem('Matras Camping', 'Rp. 20.000/hari', 'assets/images/mat.png'),
              EquipmentItem('Kompor Portable', 'Rp. 40.000/hari', 'assets/images/stove.png'),
              EquipmentItem('Sleeping Bag', 'Rp. 50.000/hari', 'assets/images/sleeping_bag.png'),
              EquipmentItem('Ransel 50L', 'Rp. 70.000/hari', 'assets/images/backpack.png'),
              EquipmentItem('Jaket Waterproof', 'Rp. 80.000/hari', 'assets/images/jacket.png'),
              EquipmentItem('Headlamp', 'Rp. 15.000/hari', 'assets/images/headlamp.png'),
              EquipmentItem('Tas Lipat', 'Rp. 25.000/hari', 'assets/images/foldable_bag.png'),
              EquipmentItem('Pisau Lipat', 'Rp. 35.000/hari', 'assets/images/folding_knife.png'),
            ]),
            SectionTitle(title: 'Best Selling'),
            EquipmentList([
              EquipmentItem('Matras Camping', 'Rp. 20.000/hari', 'assets/images/mat.png'),
              EquipmentItem('Kompor Portable', 'Rp. 40.000/hari', 'assets/images/stove.png'),
              EquipmentItem('Tenda 4 Orang', 'Rp. 55.000/hari', 'assets/images/tent.png'),
              EquipmentItem('Jaket Outdoor', 'Rp. 90.000/hari', 'assets/images/jacket.png'),
              EquipmentItem('Ransel 30L', 'Rp. 65.000/hari', 'assets/images/backpack.png'),
              EquipmentItem('Headlamp LED', 'Rp. 20.000/hari', 'assets/images/headlamp.png'),
              EquipmentItem('Sleeping Bag', 'Rp. 50.000/hari', 'assets/images/sleeping_bag.png'),
              EquipmentItem('Sepatu Hiking', 'Rp. 35.000/hari', 'assets/images/boots.png'),
              EquipmentItem('Tas Multifungsi', 'Rp. 45.000/hari', 'assets/images/foldable_bag.png'),
              EquipmentItem('Pisau Survival', 'Rp. 40.000/hari', 'assets/images/folding_knife.png'),
            ]),
            SectionTitle(title: 'Package Sale'),
            Column(
              children: [
                _buildPackageImage('../../../assets/images/promob1.png'),
                _buildPackageImage('../../../assets/images/promob2.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontFamily: 'serif',
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: isSelected,
      selectedColor: Color(0xFFFE8C00),
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildPackageImage(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'See all',
            style: TextStyle(
              fontFamily: 'serif',
              color: Color(0xFFFE8C00),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class EquipmentList extends StatelessWidget {
  final List<EquipmentItem> items;

  EquipmentList(this.items);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: items,
      ),
    );
  }
}

class EquipmentItem extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  EquipmentItem(this.title, this.price, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'serif',
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
