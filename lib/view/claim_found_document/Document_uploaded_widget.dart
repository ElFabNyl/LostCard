
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostcard/constant/custom_color.dart';


class DocumentUploadedWidget extends StatelessWidget
{
  final void Function() onPressed;
  final XFile? image;
  final double imageWidth;
  final double imageHeight;
  final IconButton iconButton;
  const DocumentUploadedWidget({Key? key,
    required this.onPressed,
    required this.image,
    required this.imageWidth,
    required this.imageHeight,
    required this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

          width: 158,
          height: 195,
        decoration: BoxDecoration(
            color: const Color(0x40FBBEE3),
            borderRadius: BorderRadius.circular(12)),


          child:  Stack(

            children: [

              Positioned(
                  //top:20,
                    //right: 20,
                  child: Center(child: Text(image!.name, style: TextStyle(color: CustomColor.primaryColor, fontWeight: FontWeight.bold),)),
                    //child: Image.file(File(image!.path),height: imageHeight, width: imageWidth,)
                ),
              
              Positioned(
                top:0,
                right: 0,
                child: iconButton,
              ) ,
            ],)
      );

  }

}