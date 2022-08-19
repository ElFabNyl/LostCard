import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/reusable_widgets/ink_icon.dart';


class ChooseUploadMediumDialog extends StatefulWidget {

  final void Function() onTapDocuments;
  final void Function() onTapCamera;
  final void Function() onTapGallery;


  const ChooseUploadMediumDialog({
    Key? key,
    required this.onTapDocuments,
    required this.onTapCamera,
    required this.onTapGallery,
  }) : super(key: key);

  @override
  ChooseUploadMediumDialogState createState() =>
      ChooseUploadMediumDialogState();
}

class ChooseUploadMediumDialogState extends State<ChooseUploadMediumDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      elevation: 4,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        height: 184,
        decoration: const BoxDecoration(
            color: Color(0xFFFDEAF5),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children:   [
                    InkIcon(icon: FontAwesomeIcons.file,
                        onTap:widget.onTapDocuments),

                     const SizedBox(height: 5,),

                     const Text('Documents',style: TextStyle(fontSize: 12), )
                  ],
                ),
                Column(
                  children:  [
                    InkIcon(icon: FontAwesomeIcons.camera,
                      onTap: widget.onTapCamera,),
                     const SizedBox(height: 5,),

                    const Text('Camera',style: TextStyle(fontSize: 12), )
                  ],
                ),



                Column(
                  children:   [
                    InkIcon(icon: FontAwesomeIcons.image,
                    onTap: widget.onTapGallery,),
                    const SizedBox(height: 5,),
                    const Text('Gallery',style: TextStyle(fontSize: 12), )
                  ],
                ),

              ],
            ),


          ],
        ),
      ),
    );
    // TODO: implement build
  }
}
