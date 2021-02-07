import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextInputType inputType;
  final bool obscureText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;

  const SignInForm({
    Key key,
    @required this.labelText,
    @required this.hintText,
    @required this.icon,
    this.inputType,
    this.obscureText,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction,
  }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: widget.inputType,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
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
