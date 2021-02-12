import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_life/Components/bottomNavBar.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/HomePage/Components/Categories.dart';
import 'package:home_life/Screens/HomePage/Components/CategoryCard.dart';
import 'package:home_life/Screens/HomePage/Components/HomeAppBar.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: HomeAppBar(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => CategoryCard(
              category: categories[index],
              press: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> categories[index].route,

                    ));
              },
            ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),

    );
  }
}




