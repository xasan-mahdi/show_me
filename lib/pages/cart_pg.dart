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
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: "Cart-Page".text.color(MyTheme.dbcl).make().centered(),
      ),
   body: Column(
     children: [
       _Cart_List().p32().expand(),
       Divider(),
       _Cart_total(),
     ],
   ), );
  }
}
class _Cart_total extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl5.color(MyTheme.dbcl).make(),
          30.widthBox,
          ElevatedButton(onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "In Aad Iibsatid Weli Lagma Shaqeysiin".text.make()));
          }, 
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.crcl)),
          child: "Proceed To Check-Out".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _Cart_List extends StatefulWidget {
  
  @override
  __Cart_ListState createState() => __Cart_ListState();
}

class __Cart_ListState extends State<_Cart_List> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBNHd7FwarbxA1xdMFt24KazjcR4dWPH_t_T5dz4YNK1s7rJAQ8gOIuR_NRw6eeiQgFhbZ9sAN&usqp=CAc").box
        .roundedFull.p3.color(Colors.white).make().p1().w20(context),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle_outline),),
        title: "I Phone 14".text.make(),
      ).py12(),
      
    );
  }
}