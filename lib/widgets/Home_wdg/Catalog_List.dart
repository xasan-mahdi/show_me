import 'package:flutter/material.dart';
import 'package:show_me/models/catalog.dart';
import 'package:show_me/pages/Hm_Dtl_pg.dart';
import 'package:show_me/widgets/Home_wdg/Ct_Img.dart';
import 'package:show_me/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>
          Hm_Dtl_pg(catalog: catalog),),),
          child: CatalogItem(catalog: catalog));
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
        Hero(
          tag: Key(catalog.id.toString()),
          child: CtImg(image: catalog.image)),
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
                 child: "Add To Cart".text.make())
              ],
            ).pOnly(right: 10.0)
            ],
          ),
        )
      ],
    )).white.roundedLg.square(160).make().py20();
  }
}
