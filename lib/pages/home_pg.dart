import 'package:flutter/material.dart';
import 'package:show_me/models/catalog.dart';
import 'package:show_me/widgets/MyDrawer.dart';
import 'package:show_me/widgets/item_widget.dart';

class home_pg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DummyList = List.generate(15, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.2,
        title: Text(
          "Online-Market",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: DummyList.length,
          itemBuilder: (context, index) {
            return itemwidget(
              item: DummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
