
import 'package:flutter/material.dart';
import 'package:home_life/Components/ShoppingCardButton.dart';



class CardAppBar extends StatelessWidget implements PreferredSizeWidget{

  CardAppBar({
    Key key,
  }) : preferredSize = Size.fromHeight(kToolbarHeight) ,super(key: key);

  @override
  final Size preferredSize;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      title: Padding(
        padding: EdgeInsets.only(left: 65),
        child: Text(
          "Your Card",
              style: TextStyle(
            color: Colors.white,
        ),
        ),
      ),
        actions:[
          Padding(
            padding: EdgeInsets.only(right: 10),
              child: ShoppingCardButton(color: Colors.white,)),

        ]
    );
  }
}


