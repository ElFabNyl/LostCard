import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhotoNotUploadedWidget extends StatelessWidget {
  final void Function() cameraPressed;
  final void Function() galleryPressed;

  const PhotoNotUploadedWidget({
    Key? key,
    required this.cameraPressed,
    required this.galleryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
          width: MediaQuery.of(context).size.width*0.42,
          height: 195,
          decoration: BoxDecoration(
              color: const Color(0xFFFBBEE3),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children:  [

                  IconButton(
                      onPressed: cameraPressed,
                      icon:  const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                        size: 25,
                      ),),

                  IconButton(
                    onPressed: galleryPressed,
                      icon: const Icon(
                        FontAwesomeIcons.image,
                        color: Colors.white,
                        size: 25,
                      ),),




              ],),

              const Text(
                'Upload Picture',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ));
  }
}
