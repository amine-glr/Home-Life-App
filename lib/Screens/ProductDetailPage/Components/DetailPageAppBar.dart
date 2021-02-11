
import 'package:flutter/material.dart';
import 'package:home_life/Screens/Tabs/ShoppingBasket.dart';


class DetailPageAppBar extends StatelessWidget implements PreferredSizeWidget {

  DetailPageAppBar({
    Key key,
  }) : preferredSize = Size.fromHeight(kToolbarHeight) ,super(key: key);

  @override
  final Size preferredSize;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      elevation: 0,
      actions: <Widget>[

        IconButton(
          onPressed: () {
          },
          icon: Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> ShoppingBasket(),
                )
            );
          },
          icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white),
        ),

      ],
    );
  }
}
