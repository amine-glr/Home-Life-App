import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_life/Components/RoundedButton.dart';
import 'package:home_life/Screens/HomePage/Home.dart';
import 'package:home_life/Screens/LoginPages/Components/SignInForm.dart';
import 'package:home_life/Screens/LoginPages/SignUpPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(
                  error
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                      "Close"
                  ))
            ],
          );
        }
    );
  }
  Future<String> _signInAccount() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _signInEmail, password: _signInPassword);
      return null;
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    }catch(e){
      return e.toString();
    }
  }

  void _submitForm() async{
    String _signInAccountFeedback= await _signInAccount();
    if(_signInAccountFeedback != null){
      _alertDialogBuilder(_signInAccountFeedback);
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> HomeScreen(),
        ),
      );
    }
  }




  String _signInEmail= "";
  String _signInPassword="";

  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode= FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }




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
                    SizedBox(height: 10),
                    Text(" Sign in with your email and password",
                   textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    SignInForm(
                        labelText: "Email",
                        hintText: "Enter your email",
                        icon: Icons.mail_outlined,
                        inputType: TextInputType.emailAddress,
                        obscureText: false ,
                      onChanged: (value){
                        _signInEmail= value;
                      },
                      onSubmitted: (value){
                        _passwordFocusNode.requestFocus();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20,),
                    SignInForm(
                      labelText: "Password",
                      hintText: "Enter your password",
                      icon: Icons.vpn_key_outlined,
                      obscureText: true,
                      onChanged: (value){
                        _signInPassword= value;
                      },
                      focusNode: _passwordFocusNode,
                      onSubmitted: (value){
                        _submitForm();
                      },
                    ),
                    SizedBox(height: 50),
                    RoundedButton(
                      text: "Continue" ,
                      onPressed: (){
                        _submitForm();
                      },
                      color: Colors.deepOrange,
                    ),

                    SizedBox(height: 30),


                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                          style: TextStyle(color: Colors.black38),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage(),
                            ),);
                          },

                          child: Text("Sign Up", style: TextStyle(
                            color: Colors.deepOrange,
                          ),

                          ),

                        )

                      ],

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







