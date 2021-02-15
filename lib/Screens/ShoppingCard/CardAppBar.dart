
import 'package:flutter/material.dart';
import 'package:home_life/Components/FavoritesButton.dart';
import 'package:home_life/Components/ShoppingCardButton.dart';



class CardAppBar extends StatelessWidget implements PreferredSizeWidget{

  CardAppBar({
    Key key, this.title,
  }) : preferredSize = Size.fromHeight(kToolbarHeight) ,super(key: key);

  @override
  final Size preferredSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange[600],
      title: Padding(
        padding: EdgeInsets.only(left: 65),
        child: Text(
          title,
              style: TextStyle(
            color: Colors.white,
        ),
        ),
      ),
        actions:[
          Padding(
              padding: EdgeInsets.only(right: 2,),
              child: FavoritesButton(color: Colors.white,)),
          Padding(
            padding: EdgeInsets.only(right: 10),
              child: ShoppingCardButton(color: Colors.white,)),

        ]
    );
  }
}


