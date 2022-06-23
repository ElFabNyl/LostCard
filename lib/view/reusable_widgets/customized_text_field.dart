


import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget{

  String labelText;
  Icon icon;

  CustomizedTextField({required this.labelText, required this.icon});

  @override
  Widget build(BuildContext context) {

    return (Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: SizedBox(
        width: 340,
        height: 52,
        child: TextField(obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),),

            labelText: labelText,
            prefixIcon: icon,





          ),
        ),
      ),
    ));

    throw UnimplementedError();
  }

}