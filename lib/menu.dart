import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
	Menu({Key? key}) : super(key: key);

	final List<ShopItem> items = [
		ShopItem("Lihat Produk", Icons.checklist),
		ShopItem("Tambah Produk", Icons.add_shopping_cart),
		ShopItem("Logout", Icons.logout),
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Trading Inventory', style: TextStyle(color: Colors.white)),
				backgroundColor: Colors.indigo,
			),
			body: SingleChildScrollView(
				child: Padding(
					padding: const EdgeInsets.all(10.0),
					child: Column(
						children: <Widget>[
							const Padding(
								padding: EdgeInsets.only(top: 10, bottom: 10),
								child: Text("Wellcome!",
									textAlign: TextAlign.center,
									style: TextStyle(
										fontSize: 30,
										fontWeight: FontWeight.bold
									),
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
			color: Colors.indigo,
			child: InkWell(
				onTap: (){
					ScaffoldMessenger.of(context)
						..hideCurrentSnackBar()
						..showSnackBar(
							SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
						);
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

  ShopItem(this.name, this.icon);
}