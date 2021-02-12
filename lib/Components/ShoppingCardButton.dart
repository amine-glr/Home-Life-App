import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:home_life/FirebaseServices.dart';
import 'package:home_life/Screens/Tabs/ShoppingBasket.dart';

class ShoppingCardButton extends StatelessWidget {

  final Color color;

  ShoppingCardButton({
    this.color,
  });


  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebaseServices.usersRef.doc(_firebaseServices.getUserId()).collection("Cart").snapshots(),
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
                  MaterialPageRoute(builder: (context)=> ShoppingBasket(),
                  )
              );
            },

            icon: Icon(
                Icons.shopping_cart_outlined,
                color: color),
          ),
        );
      },
    );
  }
}