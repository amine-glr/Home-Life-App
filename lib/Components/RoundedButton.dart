import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final String text;



  const RoundedButton({
    Key key, this.color, this.onPressed, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
      ),
    );
  }
}