
import 'package:flutter/material.dart';
import 'package:home_life/Components/FavoritesButton.dart';
import 'package:home_life/Components/ShoppingCardButton.dart';




class DetailPageAppBar extends StatelessWidget implements PreferredSizeWidget {

  DetailPageAppBar({
    Key key,
  }) : preferredSize = Size.fromHeight(kToolbarHeight) ,super(key: key);

  @override
  final Size preferredSize;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: SizedBox(
          height: 40,
          width: 40,
          child: FlatButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.white,
            onPressed: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined, color: Colors.orange,),
          ),
        ),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 2, top: 8,),
            child: FavoritesButton(color: Colors.orange, )),
        Padding(
          padding: EdgeInsets.only(right: 10, top: 8,),
            child: ShoppingCardButton(color: Colors.orange,)),

      ],


    );
  }
}
