import 'package:flutter/material.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/CategoryPages/BathroomPage.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/CategoryPages/HobbiesPage.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/CategoryPages/HomeDecorationPage.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/CategoryPages/KitchenPage.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/CategoryPages/LightingPage.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/CategoryPages/OfficeSuppliesPage.dart';

class Categories{

  final Color color;
  final int id;
  final String image, title;
  final dynamic route;

  Categories({

   this.id,
   this.title,
   this.color,
   this.image,
    this.route
});

}

List<Categories> categories= [
  Categories(
    id: 1,
    title: "Home Decoration",
    color: Colors.lightGreen ,
    image: "assets/images/home-decoration.jpg",
    route: HomeDecorationPage(),
  ),
  Categories(
    id: 2 ,
    title: "Kitchen",
    color: Colors.indigo,
    image: "assets/images/kitchen.JPG",
      route:KitchenPage(),
  ),
  Categories(
    id: 3 ,
    title: "Bathroom",
    color: Colors.blue,
    image: "assets/images/bathroom.JPG",
      route: BathroomPage(),
  ),
  Categories(
    id: 4 ,
    title: "Lighting",
    color: Colors.amberAccent,
    image: "assets/images/lighting.jpg" ,
    route: LightingPage(),
  ),
  Categories(
    id: 5 ,
    title: "Hobbies & Crafting" ,
    color: Colors.brown ,
    image: "assets/images/hobbies.JPG",
    route: HobbiesPage(),
  ),
  Categories(
    id: 6,
    title: "Office Supplies",
    color: Colors.teal,
    image: "assets/images/office.jpg" ,
      route: OfficeSuppliesPage(),
  ),

];