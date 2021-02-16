
import 'package:flutter/material.dart';
import 'package:home_life/Screens/HomePage/Home.dart';
import 'package:home_life/Screens/LoginPages/SignInPage.dart';


import 'package:home_life/Screens/Tabs/ProfilePage.dart';



class BottomNavBar extends StatefulWidget {


  BottomNavBar({Key key, }) : super(key: key);


  @override
  _BottomNavBarState createState() => _BottomNavBarState();

}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex= 0;


  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.logout
          ),
          label: 'Sign Out',
        ),

      ],
      currentIndex: _selectedIndex,

      selectedItemColor:Colors.orange[800],
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState(() {
          _selectedIndex = index;
          if(_selectedIndex==0){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> HomeScreen(),
              ),
            );
          }
          else if(_selectedIndex==1){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> ProfilePage(),
              ),
            );
          }
          else if(_selectedIndex==2){
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context)=> SignInPage(),
              ),
            );
          }
        });
      },

    );
  }
}

