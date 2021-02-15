import 'package:flutter/material.dart';
import 'package:home_life/Components/FavoritesButton.dart';
import 'package:home_life/Components/ShoppingCardButton.dart';




class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {

  HomeAppBar({
    Key key,
  }) : preferredSize = Size.fromHeight(kToolbarHeight) ,super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [

        Padding(
            padding: EdgeInsets.only(right: 2,),
            child: FavoritesButton(color: Colors.orange,)),

        Padding(
          padding: EdgeInsets.only(right: 10),
            child: ShoppingCardButton(color: Colors.orange,)),

      ],
    );
  }
}