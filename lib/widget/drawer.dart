import 'package:flutter/material.dart';
import 'package:trading_inventory_mobile/screen/add_item.dart';
import 'package:trading_inventory_mobile/screen/daftar_item.dart';
import 'package:trading_inventory_mobile/screen/menu.dart';


class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
            children: [
                const DrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                    ),
                    child: Column(
                        children: [
                            Text(
                                'Shopping List',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Text("Catat seluruh keperluan belanjamu di sini!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal
                                ),
                            ),
                        ],
                    ),
                ),
                ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('Halaman Utama'),
                    // Bagian redirection ke MyHomePage
                    onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                            builder: (context) => Menu(),
                            ));
                    },
                  ),
                ListTile(
                  leading: const Icon(Icons.add_shopping_cart),
                  title: const Text('Tambah Item'),
                  // Bagian redirection ke ShopFormPage
                  onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const AddItem()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('Daftar Item'),
                  // Bagian redirection ke ShopFormPage
                  onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DaftarItem()));
                  },
                ),
              ],
            ),
        );
    }
}