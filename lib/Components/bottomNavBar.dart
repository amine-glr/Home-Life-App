import 'package:flutter/material.dart';
import 'package:home_life/Screens/HomePage/Home.dart';
import 'package:home_life/Screens/Tabs/Favorites.dart';
import 'package:home_life/Screens/Tabs/ProfilePage.dart';



class BottomNavBar extends StatefulWidget {

  BottomNavBar({Key key}) : super(key: key);


  @override
  _BottomNavBarState createState() => _BottomNavBarState();

}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;





  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
        if(_selectedIndex==0){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> HomeScreen(),
              ),
          );
        }
      if(_selectedIndex==1){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> Favorites(),
            )
        );

      }
      if(_selectedIndex==2){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> ProfilePage(),
            )
        );

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.orange[600],

    );
  }
}

