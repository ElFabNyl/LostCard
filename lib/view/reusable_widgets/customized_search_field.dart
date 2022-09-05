import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';

class CustomizedSearchField extends StatefulWidget {
  CustomizedSearchField({
    Key? key,
    this.controller,
    this.isStringInputType,
    this.width,
    this.height,
    this.onPressed,
    this.onChanged,
    this.onTapped,
  }) : super(key: key);

  final TextEditingController? controller;

  bool? isStringInputType = true;

  final double? width;
  final double? height;
  void Function()? onPressed;
  void Function()? onTapped;
  void Function(String)? onChanged;

  @override
  CustomizedSearchFieldState createState() => CustomizedSearchFieldState();
}

class CustomizedSearchFieldState extends State<CustomizedSearchField> {
  String hintText = 'Search by Name';

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        obscureText: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                color: Color(0xFF082E02),
              )),
          suffixIcon: IconButton(
            onPressed: widget.onPressed,
            icon: Icon(FontAwesomeIcons.x,
                color: CustomColor.primaryColor, size: 10),
          ),
          hintText: 'Search by Name',
        ),
        onChanged: widget.onChanged,
        onTap: widget.onTapped,
      ),
    ));

  }
}
