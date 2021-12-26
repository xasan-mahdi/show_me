import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:show_me/models/catalog.dart';
import 'package:show_me/widgets/Home_wdg/Catalog_List.dart';
import 'package:show_me/widgets/Home_wdg/Ct_Hd.dart';
import 'package:show_me/widgets/MyDrawer.dart';
import 'package:show_me/widgets/item_widget.dart';
import 'package:show_me/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


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
    //theme: ThemeMode.light;
    return Scaffold(
      backgroundColor: MyTheme.whcl,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: MyTheme.crcl,
        child: Icon(CupertinoIcons.cart),),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                om_hd(),
                CupertinoSearchTextField(
                  borderRadius: BorderRadius.circular(19),
                ).h4(context).py16(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            )),
      ),
    );
  }
}
