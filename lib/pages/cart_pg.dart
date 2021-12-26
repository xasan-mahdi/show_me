import 'package:flutter/material.dart';
import 'package:show_me/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
class Cart_Pg extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whcl,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart-Page".text.make(),
      ),
    );
  }
}