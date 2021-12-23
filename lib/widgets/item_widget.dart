import 'package:flutter/material.dart';
import 'package:show_me/models/catalog.dart';

class itemwidget extends StatelessWidget {
  final Item item;

  const itemwidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () {
            print("${item.name} Pressed");
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.7,
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          )),
    );
  }
}
