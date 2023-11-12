import 'package:flutter/material.dart';
import 'package:trading_inventory_mobile/screen/add_item.dart';
import 'package:trading_inventory_mobile/widget/appbar.dart';
import 'package:trading_inventory_mobile/screen/daftar_item.dart';
import 'package:trading_inventory_mobile/widget/drawer.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist, const Color(0xFFE9C46A)),
    ShopItem("Tambah Produk", Icons.add_shopping_cart, const Color(0xFFF4A261)),
    ShopItem("Logout", Icons.logout, const Color(0xFFE76F51)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Wellcome!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) => ShopCard(item)).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          if (item.name == "Tambah Produk") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddItem()));
          }else if(item.name == "Lihat Produk") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DaftarItem()));
          }
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final IconData icon;
  late Color color;

  ShopItem(this.name, this.icon, this.color);
}
