
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_life/Components/RoundedButton.dart';
import 'package:home_life/Screens/LoginPages/SignInPage.dart';
import 'package:home_life/Screens/LoginPages/SignUpPage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "WELCOME TO \nHOME&LIFE",
              style:
              GoogleFonts.getFont(
                'Source Serif Pro',
                textStyle:TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),

            Image.asset(
               "assets/images/Wavy_Bus-26_Single-01.jpg",
                height: 250,
              width: 250,
            ),

            SizedBox(height: 40,),
            RoundedButton(
              text: "Sign In",
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>SignInPage(),
                  ),);
              },
              color: Colors.deepOrange,
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              text: "Sign Up",
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>SignUpPage(),
                  ),);
              },
              color: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}


