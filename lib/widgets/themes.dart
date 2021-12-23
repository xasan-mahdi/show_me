import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.pink,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
  );
}
