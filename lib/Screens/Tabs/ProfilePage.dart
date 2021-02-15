import 'package:flutter/material.dart';

import 'package:home_life/Components/bottomNavBar.dart';
import 'package:home_life/Screens/ShoppingCard/CardAppBar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CardAppBar(title: "Profile"),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
