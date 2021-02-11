import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_life/Constants/Constants.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final String text;



  const RoundedButton({
    Key key, this.color, this.onPressed, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          onPressed: onPressed,
          child: Text(text, style: GoogleFonts.getFont(
            'Nunito Sans',
            textStyle: Constants.buttonText,
          ),),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: color,
        ),
      ),
    );
  }
}