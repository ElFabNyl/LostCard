


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';


class PhotoUploadedWidget extends StatelessWidget
{
  final void Function() onPressed;
  final XFile? image;
  final double imageWidth;
  final double imageHeight;
  final IconButton iconButton;
  const PhotoUploadedWidget({Key? key,
    required this.onPressed,
    required this.image,
    required this.imageWidth,
    required this.imageHeight,
    required this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
          width: imageWidth,
          height: imageHeight,


          child:  Stack(

            children: [


              Positioned(
                //top:20,
                  //right: 20,
                  child: Image.file(File(image!.path),height: imageHeight, width: imageWidth,)),
              Positioned(
                top:0,
                right: 0,
                child: iconButton
              ) ,
            ],)
      );

  }

}