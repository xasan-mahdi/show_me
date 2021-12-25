import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:show_me/models/catalog.dart';
import 'package:show_me/widgets/MyDrawer.dart';
import 'package:show_me/widgets/item_widget.dart';

class home_pg extends StatefulWidget {
  @override
  State<home_pg> createState() => _home_pgState();
}

class _home_pgState extends State<home_pg> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final cj = await rootBundle.loadString("assets/files/catalog.json");
    final dd = jsonDecode(cj);
    var prdt = dd["products"];
    CatalogModel.items =
        List.from(prdt).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 11),
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            final item = CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                header: Container(
                  child: Text(item.name,style: 
                TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFffcccc),Color(0xFF59FFFF),Color(0xFF00FF00),
                  ],begin: Alignment.topRight,end: Alignment.topLeft)
                ),),
                child: Image.network(item.image,fit: BoxFit.cover,),
                footer: Container(child: Text("\$${item.price}",textScaleFactor: 1.2,
                textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFFD0505),Color(0xFF06080F),
                  ],begin: Alignment.topRight,end: Alignment.topLeft)
                ),),));
          }
        )
        : Center(child: CircularProgressIndicator(),),
      ),
      drawer: MyDrawer(),
    );
  }
}
