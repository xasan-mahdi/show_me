import 'package:flutter/material.dart';
import 'package:show_me/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class om_hd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Online-Market".text.xl6.bold.color(MyTheme.crcl).make(),
        "Trending Products".text.xl3.make()
      ],
    );
  }
}
