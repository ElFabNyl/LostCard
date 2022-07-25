import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/search_result_page/search_result.dart';

class CustomizedModifyTextField extends StatefulWidget {
  CustomizedModifyTextField({
    Key? key,
    this.controller,


    this.isStringInputType,

    this.width,
    this.height,
    this.onPressed,
    this.labelText,
    this.prefixIcon,
    this.hintText,



  }) : super(key: key);

  final TextEditingController? controller;



  bool? isStringInputType = true;


  final double? width;
  final double? height;
  void Function()? onPressed;
  final String? labelText;
  final String? hintText;
  Icon? prefixIcon;




  CustomizedModifyTextFieldState createState() => CustomizedModifyTextFieldState();
}

class CustomizedModifyTextFieldState extends State<CustomizedModifyTextField> {

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        obscureText:  false ,
        keyboardType:  TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                color: Color(0xFF082E02),
              )
          ),

          suffixIcon:  IconButton(
            onPressed: widget.onPressed,
            icon: Icon(FontAwesomeIcons.solidPenToSquare, color: CustomColor().IconsColor, size:15),
          ),
          prefixIcon: widget.prefixIcon,
          labelText: widget.labelText,
          hintText: widget.hintText,

        ),
        onChanged:  (value) {
          setState(() {

          });
        },
      ),
    ));

    throw UnimplementedError();
  }


}

