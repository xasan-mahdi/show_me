import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_me/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImageUrl =
        "https://images.unsplash.com/photo-1600804889194-e6fbf08ddb39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFuZHNvbWUlMjBtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60";
    return Drawer(
      child: Container(
        color: Colors.pink,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text('Hazan Mahdi'),
              accountEmail: Text("xasabax50@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(ImageUrl),
              ),
            ),
          ),
          ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white),
              title: Text("Home",style: TextStyle(color: Colors.white),textScaleFactor: 1.5,),
          ),
           ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white),
              title: Text("Profile",style: TextStyle(color: Colors.white),textScaleFactor: 1.5,),
          ),
           ListTile(
              leading: Icon(CupertinoIcons.mail,color: Colors.white),
              title: Text("Mail Me",style: TextStyle(color: Colors.white),textScaleFactor: 1.5,),
          ),
           ListTile(
             onTap: () {
               Navigator.pushNamed(context, Myrt.lr);
             },
              leading: Icon(CupertinoIcons.lock_open,color: Colors.white),
              title: Text("Log Out",style: TextStyle(color: Colors.white),textScaleFactor: 1.5,),
          )
        ],
      ),
      )
    );
  }
}
