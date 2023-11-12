import 'package:flutter/material.dart';
import 'package:trading_inventory_mobile/widget/appbar.dart';
import 'package:trading_inventory_mobile/data.dart';

class DaftarItem extends StatelessWidget {
  DaftarItem({super.key});

  final List<Data> dataList = Data.objects;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataList[index].name),
            subtitle: Text('Amount: ${dataList[index].amount}'),
            trailing: Text(dataList[index].description),
            onTap: () {
              // Aksi yang akan diambil saat item list diklik
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text(
                        "Kamu telah menekan tombol ${dataList[index].name}!")));
            },
          );
        },
      ),
    );
  }
}
