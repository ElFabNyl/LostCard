


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PhotoUploadedWidget extends StatelessWidget
{
  const PhotoUploadedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(


        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon:  const Icon(FontAwesomeIcons.camera, color: Colors.white, size: 25,),
              onPressed: () {

              },
            ),

            const Text('Upload Picture', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)
          ],)
    );

  }

}