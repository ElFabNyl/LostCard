

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostcard/view/register_found_document_page/photo_uploaded_widget.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import '../../constant/custom_color.dart';
import '../../controllers/claim_lost_document_controller.dart';
import '../../model/claim_lost_document_model.dart';
import '../../utils/manage_image_and_file.dart';
import '../nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import '../register_found_document_page/photo_not_uploaded_widget.dart';
import '../reusable_widgets/app_part_container.dart';
import '../reusable_widgets/custom_found_notification_dialog.dart';
import '../reusable_widgets/loading_indicator.dart';

class ClaimLostDocument extends StatefulWidget {

  final String idDocument;

  const ClaimLostDocument({Key? key,
    required this.idDocument

  }) : super(key: key);

  @override
  ClaimLostDocumentState createState() => ClaimLostDocumentState();
}

class ClaimLostDocumentState extends State<ClaimLostDocument> {
  //late XFile? image;
  final imagePicker = ImagePicker();
  late List<XFile>? imageSelectedFromGallery;

  List<File>listOfAuthenticationFiles = [];
  List<String>finalList = [];
  XFile? imageRecto = XFile('');
  File? documentRecto = File('');
  File? documentVerso = File('');
  XFile? imageVerso = XFile('');
  String documentImageUrl = '';


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
                                cameraPressed: () async {
                                  imageRecto =
                                  await ManageImageAndFile().getImageByCamera();

                                  //documentRecto = File(imageRecto!.path);


                                  setState(() {
                                    if (imageRecto != null) {
                                      isNotFilledWithImageRecto = false;
                                      documentRecto = File(imageRecto!.path);
                                      listOfAuthenticationFiles.add(File(imageRecto!.path));

                                    }
                                  }
                                  );
                                },
                                galleryPressed: () async {
                                  imageSelectedFromGallery = await ManageImageAndFile().getImageByGallery();

                                  var count = 0;


                                  setState(() {

                                    if (imageSelectedFromGallery != null) {

                                      while (count <imageSelectedFromGallery!.length) {


                                        listOfAuthenticationFiles.add(File(imageSelectedFromGallery![count].path));
                                        isNotFilledWithImageRecto = false;
                                        imageRecto = imageSelectedFromGallery![count];
                                        listOfAuthenticationFiles.add(File(imageRecto!.path));

                                        count++;
                                      }
                                    }




                                  }

                                  );


                                },)
                                  : PhotoUploadedWidget(
                                      imageWidth:
                                          MediaQuery.of(context).size.width *
                                              0.42,
                                      imageHeight: 195,
                                      image: imageRecto,
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
                                cameraPressed: () async {
                                  imageVerso =
                                  await ManageImageAndFile().getImageByCamera();


                                  setState(() {
                                    if (imageVerso != null) {
                                      documentVerso = File(imageVerso!.path);
                                      listOfAuthenticationFiles.add(File(imageVerso!.path));
                                      isNotFilledWithImageVerso = false;

                                    }
                                  });
                                },
                                galleryPressed: () async{

                                  imageSelectedFromGallery = await ManageImageAndFile().getImageByGallery();

                                  var count = 0;


                                  setState(() {

                                    if (imageSelectedFromGallery != null) {

                                      while (count <imageSelectedFromGallery!.length) {


                                        listOfAuthenticationFiles.add(File(imageSelectedFromGallery![count].path));
                                        isNotFilledWithImageVerso = false;
                                        imageVerso = imageSelectedFromGallery![count];
                                        listOfAuthenticationFiles.add(File(imageRecto!.path));

                                        count++;
                                      }
                                    }




                                  }

                                  );


                                },)
                                  : PhotoUploadedWidget(
                                      imageWidth:
                                          MediaQuery.of(context).size.width *
                                              0.42,
                                      imageHeight: 195,
                                      image: imageVerso,
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
                          onPressed: () async{

                            int i = 0;
                            LoadingIndicator(context).startLoading();
                            while(i< listOfAuthenticationFiles.length){
                              final ref = FirebaseStorage.instance.ref().child("claimedLostDocumentImages").child(i.toString()+DateTime.now().toString()+FirebaseAuth.instance.currentUser!.uid+".jpg");
                              await ref.putFile(listOfAuthenticationFiles[i]);
                              documentImageUrl = await ref.getDownloadURL();
                              finalList.add(documentImageUrl);
                              i++;


                            }

                            print('Final list is: '+finalList.length.toString());

                            // final ref1 = FirebaseStorage.instance.ref().child("foundDocumentImages").child("verso"+FirebaseAuth.instance.currentUser!.uid+".jpg");
                            // await ref1.putFile(documentVerso!);
                            // documentVersoImageUrl = await ref1.getDownloadURL();

                            // final ref2 = FirebaseStorage.instance.ref().child("foundDocumentImages").child("recto"+FirebaseAuth.instance.currentUser!.uid+".jpg");
                            // await ref2.putFile(documentRecto!);
                            // documentRectoImageUrl =  await ref2.getDownloadURL() ;

                            ClaimLostDocumentModel claimLostDocumentModel = ClaimLostDocumentModel(
                              idUser: FirebaseAuth.instance.currentUser!.uid,
                              idLostDocument: widget.idDocument,
                              listOfAuthenticationFiles: finalList,
                              idClaimLostDocument: '',);



                            await ClaimLostDocumentController()
                                .addClaimedLostDocument(claimLostDocumentModel);



                            LoadingIndicator(context).stopLoading();



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
