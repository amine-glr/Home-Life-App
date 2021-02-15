import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:home_life/Screens/Tabs/Favorites.dart';

import '../FirebaseServices.dart';

class FavoritesButton extends StatelessWidget {

  final Color color;


  FirebaseServices _firebaseServices = FirebaseServices();

  FavoritesButton({
    this.color,
        });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebaseServices.usersRef.doc(_firebaseServices.getUserId()).collection("Favorites").snapshots(),
      builder: (context, snapshot) {
        int _totalItems = 0;

        if(snapshot.connectionState == ConnectionState.active) {
          List _documents = snapshot.data.docs;
          _totalItems = _documents.length;
        }

        return Badge(
          position: BadgePosition.topEnd(top: -1, end: -1),
          badgeColor: Colors.grey,
          badgeContent: Text(
            "$_totalItems" ?? "0",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          child:IconButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Favorites(),
                  )
              );
            },

            icon: Icon(
                Icons.favorite_border_outlined,
                color: color),
          ),
        );
      },
    );
  }
}
