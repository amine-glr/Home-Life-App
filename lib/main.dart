
import 'package:flutter/material.dart';

import 'package:home_life/Components/theme.dart';
import 'package:home_life/LandingPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home&Life',
      theme: theme(),
      home: LandingPage(),
    );
  }
}




