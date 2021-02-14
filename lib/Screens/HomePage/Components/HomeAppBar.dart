import 'package:flutter/material.dart';
import 'package:home_life/Components/FavoritesButton.dart';
import 'package:home_life/Components/ShoppingCardButton.dart';
import 'package:home_life/Screens/Tabs/Favorites.dart';



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
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(right: 2,),
            child: FavoritesButton(color: Colors.orange, onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Favorites()));
            },)),

        Padding(
          padding: EdgeInsets.only(right: 10),
            child: ShoppingCardButton(color: Colors.orange,)),

      ],
    );
  }
}