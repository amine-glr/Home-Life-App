import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextInputType inputType;
  final bool obscureText;

  const SignInForm({
    Key key,
    @required this.labelText,
    @required this.hintText,
    @required this.icon,
    this.inputType,
    this.obscureText,
  }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey= GlobalKey<FormState>();

  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: widget.inputType,
            validator: (value){
              if(value.isEmpty){
                setState((){
                  errors.add("Email and password can not be empty");
                });
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Icon(
                  widget.icon,
                  color: Colors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: Colors.grey),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: Colors.grey),
                gapPadding: 10,
              ),
            ),
          )
        ],
      ),

    );
  }
}
