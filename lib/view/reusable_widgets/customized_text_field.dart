import 'package:flutter/material.dart';

class CustomizedTextField extends StatefulWidget {
  CustomizedTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.suffixIconBeforeTap,
    this.hintText,
    this.isStringInputType,
    this.isPassword,
    this.width,
    this.height,
    this.errorText,
    this.onChanged,

  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  Icon? prefixIcon;
  Icon? suffixIcon;

  Icon? suffixIconOnTap;
  Icon? suffixIconBeforeTap;
  final String? hintText;
  bool? isStringInputType = true;
  bool? isPassword;

  final double? width;
  final double? height;
  String? errorText;
  void Function(String)? onChanged;


  CustomizedTextFieldState createState() => CustomizedTextFieldState();
}

class CustomizedTextFieldState extends State<CustomizedTextField> {


  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        obscureText: ((widget.isPassword!) ? true : false),
        keyboardType: ((widget.isStringInputType!)
            ? TextInputType.text
            : TextInputType.number),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                color: Color(0xFF082E02),
              )),
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.isPassword = !(widget.isPassword!);
              });
            },
            child: ((widget.isPassword!)
                ? widget.suffixIconBeforeTap
                : widget.suffixIconOnTap),
          ),
          hintText: widget.hintText,
          errorText: widget.errorText,
        ),
        onChanged: widget.onChanged,

      ),
    ));

    throw UnimplementedError();
  }


  }

