import 'package:flutter/material.dart';
import 'package:home_life/Components/ShoppingCardButton.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/HomePage/Home.dart';

import 'package:home_life/Screens/LoginPages/SignInPage.dart';
import 'package:home_life/Screens/Tabs/ShoppingBasket.dart';


class PageAppBar extends StatelessWidget implements PreferredSizeWidget{
  PageAppBar({
    Key key,
  }) : preferredSize = Size.fromHeight(kToolbarHeight) ,super(key: key);

  @override
  final Size preferredSize;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: <Widget> [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> HomeScreen(),
                )
            );
          },
          icon: Icon(
              Icons.arrow_back,
              color: Colors.orange),
        ),
        Expanded(

          child:Container(

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (value) => print(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
              ),
            ),
          ),
        ),
        ShoppingCardButton(color: Colors.orange,),
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> SignInPage(),
                )
            );
          },
          icon: Icon(
            Icons.person,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}