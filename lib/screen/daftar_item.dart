import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:trading_inventory_mobile/models/item.dart';
import 'package:trading_inventory_mobile/screen/detail_item.dart';
import 'package:trading_inventory_mobile/widget/appbar.dart';
import 'package:trading_inventory_mobile/data.dart';
import 'package:trading_inventory_mobile/widget/drawer.dart';

class DaftarItem extends StatefulWidget {
  DaftarItem({super.key});

  @override
  State<DaftarItem> createState() => _DaftarItemState();
}

class _DaftarItemState extends State<DaftarItem> {

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Future<List<Item>> response = request
        .postJson("http://127.0.0.1:8000/get_my_data",
            jsonEncode(<String, String>{"Content-Type": "application/json"}))
        .then((value) {
      if (value == null) {
        return [];
      }
      var jsonValue = jsonDecode(value);
      List<Item> listItem = [];
      for (var data in jsonValue) {
        if (data != null) {
          listItem.add(Item.fromJson(data));
        }
      }
      return listItem;
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: response,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: InkWell(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailItem(snapshot.data![index])))
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data![index].fields.name} - \$${snapshot.data![index].fields.buyPrice}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                }
              }
            }));
  }
}
