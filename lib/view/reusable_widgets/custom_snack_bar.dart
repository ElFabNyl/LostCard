
import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';

class CustomSnackBar{

  void showCustomSnackBar(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: CustomColor.primaryColor,));
  }


}