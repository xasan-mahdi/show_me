import 'package:flutter/material.dart';
import 'package:show_me/utils/routes.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _fk = GlobalKey<FormState>();
  bool cb = false;
  String Name = "";
  moveToHome(BuildContext context) async {
    if (_fk.currentState!.validate()) {
      setState(() {
        cb = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myrt.hr);
      setState(() {
        cb = false;
        Name = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _fk,
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                "Soo Dhaawoow Mudane: $Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Image.asset(
                "assets/img/lg.png",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 34),
                child: Column(
                  children: [
                    TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "UserName",
                          hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          labelText: "UserName",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 3.0))),
                      onChanged: (value) {
                        Name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "UserName Ka Ma Banaanan karo";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 28),
                    TextFormField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 3.0))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Ka Soo geli";
                        } else if (value.length < 6) {
                          return 'Password-ka Kama yaran karo 6 Xarfood';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 39),
              Material(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: cb ? 50 : 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: cb
                        ? Icon(Icons.done, color: Colors.white)
                        : Text("Login"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
