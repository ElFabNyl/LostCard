import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostcard/view/register_found_document_page/photo_uploaded_widget.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import '../../constant/custom_color.dart';
import '../../utils/manage_image_and_file.dart';
import '../nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import '../register_found_document_page/photo_not_uploaded_widget.dart';
import '../reusable_widgets/app_part_container.dart';
import '../reusable_widgets/custom_found_notification_dialog.dart';

class ClaimLostDocument extends StatefulWidget {
  const ClaimLostDocument({Key? key}) : super(key: key);

  @override
  ClaimLostDocumentState createState() => ClaimLostDocumentState();
}

class ClaimLostDocumentState extends State<ClaimLostDocument> {
  late XFile? image;
  final imagePicker = ImagePicker();

  bool isNotFilledWithImageRecto = true;

  bool isNotFilledWithImageVerso = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppPartContainer(
                  backButton: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.angleLeft,
                        color: CustomColor.primaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavBarPagesManager(
                                    selectedIndex: 0,
                                  )),
                        );
                      }),
                  partName: "Claim Lost Document ",
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              child: isNotFilledWithImageRecto
                                  ? PhotoNotUploadedWidget(
                                      onTap: () async {
                                        image = await ManageImageAndFile()
                                            .getImageByCamera();
                                        setState(() {
                                          if (image != null) {
                                            isNotFilledWithImageRecto = false;
                                          }
                                        });
                                      },
                                    )
                                  : PhotoUploadedWidget(
                                      imageWidth:
                                          MediaQuery.of(context).size.width *
                                              0.42,
                                      imageHeight: 195,
                                      image: image,
                                      onPressed: () {
                                        setState(() {
                                          isNotFilledWithImageRecto = true;
                                        });
                                      },
                                      iconButton: IconButton(
                                          icon: const Icon(
                                            FontAwesomeIcons.xmark,
                                            color: Colors.blue,
                                            size: 15,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isNotFilledWithImageRecto = true;
                                            });
                                          }),
                                    )),
                          SizedBox(
                              child: isNotFilledWithImageVerso
                                  ? PhotoNotUploadedWidget(
                                      onTap: () async {
                                        image = await ManageImageAndFile()
                                            .getImageByCamera();
                                        setState(() {
                                          if (image != null) {
                                            isNotFilledWithImageVerso = false;
                                          }
                                        });
                                      },
                                    )
                                  : PhotoUploadedWidget(
                                      imageWidth:
                                          MediaQuery.of(context).size.width *
                                              0.42,
                                      imageHeight: 195,
                                      image: image,
                                      onPressed: () {
                                        setState(() {
                                          isNotFilledWithImageVerso = true;
                                        });
                                      },
                                      iconButton: IconButton(
                                          icon: const Icon(
                                            FontAwesomeIcons.xmark,
                                            color: Colors.blue,
                                            size: 15,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isNotFilledWithImageVerso = true;
                                            });
                                          }),
                                    )),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      const Text(
                        'Verification Proofs',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF49454F)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Please properlly snap recto and verso the document you attest to have found .',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 180,
                      ),
                      CustomizedTextButton(
                          text: 'Submit',
                          buttonWidth: 160,
                          buttonHeight: 40,
                          border: 'border',
                          textColor: Colors.white,
                          textFontSize: 14,
                          backgroundColor: CustomColor.primaryColor,
                          onPressed: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return   FoundNotificationDialog(message: 'Please bring the document to Messassi ICT university'
                                      ' along with the reward code we will send to you now through sms in order to claim your reward',
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>  NavBarPagesManager(selectedIndex: 0)),
                                      );
                                    },

                                  );
                                });
                          },

                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
