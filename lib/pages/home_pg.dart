import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:show_me/models/catalog.dart';
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
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              children: [
                om_hd(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            )),
      ),
    );
  }
}

class om_hd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Online-Market".text.xl6.bold.color(MyTheme.crcl).make(),
        "Trending Products".text.xl3.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CtImg(image: catalog.image),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [catalog.name.text.xl2.color(MyTheme.dbcl).make(),
            catalog.desc.text.make(), 10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl2.make(),
                ElevatedButton(onPressed: () {},
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all( MyTheme.crcl),
                shape: MaterialStateProperty.all(StadiumBorder())),
                 child: "Buy".text.make())
              ],
            ).pOnly(right: 10.0)
            ],
          ),
        )
      ],
    )).white.roundedLg.square(160).make().py20();
  }
}

class CtImg extends StatelessWidget {
  final String image;

  const CtImg({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.whcl)
        .make()
        .p16()
        .w32(context);
  }
}
