import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/HomePage/Components/Categories.dart';

class CategoryCard extends StatelessWidget {
  final Categories category;
  final Function press;

  const CategoryCard({
    Key key,
    this.category,
    this.press,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: category.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: Image.asset(
                  category.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric( vertical:6),
            child: Text(category.title,
              style: TextStyle(color: Colors.black ),),
          ),
        ],
      ),
    );
  }
}