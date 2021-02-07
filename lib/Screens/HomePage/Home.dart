import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_life/Models/Categories.dart';
import 'package:home_life/Screens/HomePage/Components/CategoryCard.dart';
import 'package:home_life/Screens/LoginPages/SignInPage.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Expanded(
              child:Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
                child: TextField(
              onChanged: (value) => print(value),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search product",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
          IconButton(
            onPressed: () {
              },
            icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.orange),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> SignInPage(),
                  ),
                 );
              },
            icon: Icon(
              Icons.person,
              color: Colors.orange,
            ),
          ),
        ],
      ),

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

    );
  }
}


