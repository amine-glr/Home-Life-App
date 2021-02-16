
import 'package:flutter/material.dart';

import 'package:home_life/Components/bottomNavBar.dart';
import 'package:home_life/Screens/LoginPages/SignInPage.dart';
import 'package:home_life/Screens/ShoppingCard/CardAppBar.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CardAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
          SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/signIn.JPG"),
              ),
            ],
          ),
        ),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: Icons.account_box_outlined,
              press: () => {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () {},
            ),

            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout,
              press: () {
                setState(() {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context)=> SignInPage(),
                    ),
                  );
                });

              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            Icon(
               icon,
              color: Colors.blue,
            ),

            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}