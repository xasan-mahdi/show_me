import 'package:flutter/material.dart';
import 'package:show_me/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


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
