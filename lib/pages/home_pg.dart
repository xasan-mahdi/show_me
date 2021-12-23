import 'package:flutter/material.dart';
import 'package:show_me/widgets/MyDrawer.dart';

class home_pg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String cr = "Flutter";
    final int dy = 30;
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
      body: Center(
        child: Text(
          "Welcome To $cr-Course Oo Soconaysa $dy Malmod",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.1,
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
