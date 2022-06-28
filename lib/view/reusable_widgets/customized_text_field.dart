import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  String labelText;
  Icon preffixIcon;
  Icon suffixIcon;

  CustomizedTextField(
      {required this.labelText,
      required this.preffixIcon,
      required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      width: 350,
      height: 52,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          labelText: labelText,
          prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    ));

    throw UnimplementedError();
  }
}
