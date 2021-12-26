import 'package:flutter/material.dart';
import 'package:show_me/pages/cart_pg.dart';

import 'pages/home_pg.dart';
import 'pages/login.dart';
import 'utils/routes.dart';

void main() {
  runApp(test());
}

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => home_pg(),
        Myrt.hr: (context) => home_pg(),
        Myrt.lr: (context) => login(),
        Myrt.cprt: (context) => Cart_Pg(),
      },
    );
  }
}
