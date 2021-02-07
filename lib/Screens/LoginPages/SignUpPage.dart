import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_life/Screens/HomePage/Home.dart';
import 'package:home_life/Screens/LoginPages/Components/SignInForm.dart';
import 'package:home_life/Screens/LoginPages/Components/SocialCard.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  Future<String> _createAccount() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
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
      String _createAccountFeedback= await _createAccount();
      if(_createAccountFeedback != null){
          _alertDialogBuilder(_createAccountFeedback);
      }
      else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> HomeScreen(),
          ),
        );
      }
  }


  String _registerEmail= "";
  String _registerPassword="";

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
        title: Text("Sign Up",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text( "Register Account ",
                      style:TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(" Complete de necessary information \nor continue with social media",
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
                        _registerEmail= value;
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
                        _registerPassword= value;
                      },
                      focusNode: _passwordFocusNode,
                      onSubmitted: (value){
                        _submitForm();
                      },
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FlatButton(
                        onPressed: () {
                          _submitForm();
                          },
                        child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 18),),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SocialCard(icon: "assets/images/facebook.png",),
                        SocialCard(icon: "assets/images/google.png",),
                        SocialCard(icon: "assets/images/Twitter.png",),
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
