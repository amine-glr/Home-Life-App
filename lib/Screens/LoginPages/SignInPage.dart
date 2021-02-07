import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_life/Screens/HomePage/Home.dart';
import 'package:home_life/Screens/LoginPages/Components/SignInForm.dart';
import 'package:home_life/Screens/LoginPages/Components/SocialCard.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In",
        textAlign: TextAlign.center,
        ),
        centerTitle: true,

      ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text( "Welcome Back ",
                        style:TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                    ),

                    Text(" Sign in with your password \nor continue with social media",
                   textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    SignInForm(
                        labelText: "Email",
                        hintText: "Enter your email",
                        icon: Icons.mail_outlined,
                        inputType: TextInputType.emailAddress,
                        obscureText: false ,
                    ),
                    SizedBox(height: 20,),
                    SignInForm(
                      labelText: "Password",
                      hintText: "Enter your password",
                      icon: Icons.vpn_key_outlined,
                      obscureText: true,
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> HomeScreen(),
                                )
                            );
                          },
                          child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 18),),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SocialCard(icon: "assets/images/facebook.png",),
                        SocialCard(icon: "assets/images/google.png",),
                        SocialCard(icon: "assets/images/Twitter.png",),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text("Don't have an account click here to join", style: TextStyle(color: Colors.black38),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}







