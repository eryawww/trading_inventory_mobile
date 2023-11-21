import 'package:flutter/material.dart';
import 'package:trading_inventory_mobile/models/item.dart';
import 'package:trading_inventory_mobile/widget/appbar.dart';
import 'package:trading_inventory_mobile/widget/drawer.dart';

class DetailItem extends StatelessWidget {
  final Item item;

  const DetailItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: LeftDrawer(),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text("BUY PRICE : ${item.fields.buyPrice}"),
            Text("AMOUNT : ${item.fields.amount}"),
            Text("TIME BOUGHT : ${item.fields.timeBuy}"),
            const SizedBox(height: 10),
            Text("${item.fields.description}")
          ],
        ),
      ),
    );
  }
}
