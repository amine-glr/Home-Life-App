import 'package:flutter/material.dart';
import 'package:home_life/Components/bottomNavBar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Padding(
          padding: EdgeInsets.only(left: 65),
          child: Text(
            "Your Card",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
