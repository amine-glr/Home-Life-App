import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  final String icon;

  const SocialCard({
    Key key,
    this.icon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      onPressed: (){

      },
      highlightColor: Colors.grey,

      shape: CircleBorder(),
      child:  Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(4),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(icon),
      ),
    );
  }
}