import 'package:flutter/material.dart';
import 'package:show_me/models/catalog.dart';
import 'package:show_me/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Hm_Dtl_pg extends StatelessWidget {
  final Item catalog;

  const Hm_Dtl_pg({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: MyTheme.whcl,
        child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl5.red500.make(),
                  ElevatedButton(onPressed: () {},
                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all( MyTheme.crcl),
                  shape: MaterialStateProperty.all(StadiumBorder())),
                   child: "Add To Cart".text.make()).wh(100, 55)
                ],
              ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)).h48(context),
                Expanded(child: VxArc(
                  height: 55,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: MyTheme.whcl,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl5.color(MyTheme.dbcl).make(),
                        catalog.desc.text.xl2.make(), 10.heightBox,
                        "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.is simply dummy text of the printing and typesetting industry. remaining essentially unchanged.the printing Industry"
                        .text.xl.make().p16()
                      ],
                    ).p64(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
