import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostcard/controllers/claim_document_controller.dart';
import 'package:lostcard/model/claim_document_model.dart';
import 'package:lostcard/view/reusable_widgets/photo_uploaded_widget.dart';
import 'package:lostcard/view/reusable_widgets/choose_upload_medium_dialog.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/loading_indicator.dart';
import 'package:path/path.dart';
import '../../constant/custom_color.dart';
import '../../utils/manage_image_and_file.dart';
import '../nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import '../reusable_widgets/app_part_container.dart';
import '../reusable_widgets/custom_found_notification_dialog.dart';
import 'Document_uploaded_widget.dart';

class ClaimFoundDocument extends StatefulWidget {
  final String idDocument;

  const ClaimFoundDocument({Key? key,
    required this.idDocument,

  }) : super(key: key);

  @override
  ClaimFoundDocumentState createState() => ClaimFoundDocumentState();
}

class ClaimFoundDocumentState extends State<ClaimFoundDocument> {
  late XFile? image;
  late List<XFile> documentSelected;
  late List<XFile>? imageSelectedFromGallery;

  List<File>listOfAuthenticationFiles = [];

  final imagePicker = ImagePicker();


  bool isLogoVisible = true;

  List<Widget> abc = [];

  int i = 0;

  bool isFloatingActionButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: MediaQuery
                  .of(context)
                  .size
                  .height - (MediaQuery
                  .of(context)
                  .size
                  .height - 90),
              right: 20,
              child: SizedBox(
                width: 56,
                height: 56,
                child: FloatingActionButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        )),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ChooseUploadMediumDialog(
                              onTapDocuments: () async {
                                documentSelected =
                                await ManageImageAndFile().getDocuments();
                                var count = 0;
                                setState(
                                      () {
                                        isFloatingActionButtonTapped = true;
                                    while (count < documentSelected.length) {
                                      abc.add(DocumentUploadedWidget(
                                          onPressed: () {
                                            setState(
                                                  () {
                                                //abc.removeAt(i);
                                                //isFile1Uploaded = false;
                                              },
                                            );
                                          },
                                          iconButton: IconButton(
                                              icon: const Icon(null),
                                              onPressed: () {

                                              }
                                          ),
                                          image: documentSelected[count],
                                          imageWidth: 158,
                                          imageHeight: 195)

                                      );


                                      listOfAuthenticationFiles.add(File(documentSelected[count].path));

                                      count++;
                                    }
                                    isLogoVisible = false;
                                  },
                                );
                              },
                              onTapCamera: () async {
                                image = await ManageImageAndFile()
                                    .getImageByCamera();
                                setState(
                                      () {
                                        isFloatingActionButtonTapped = true;
                                    if (image != null) {
                                      isLogoVisible = false;
                                      abc.add(PhotoUploadedWidget(
                                        imageHeight: 195,
                                        imageWidth: 158,
                                        image: image,
                                        onPressed: () {
                                          setState(
                                                () {
                                              //abc.removeAt(i);
                                              //isFile1Uploaded = false;
                                            },
                                          );
                                        },
                                        iconButton: IconButton(
                                            icon: const Icon(null),
                                            onPressed: () {

                                            }
                                        ),
                                      ));


                                      listOfAuthenticationFiles.add(File(image!.path));

                                    }
                                  },
                                );
                              },
                              onTapGallery: () async {
                                imageSelectedFromGallery =
                                await ManageImageAndFile()
                                    .getImageByGallery();
                                var count = 0;

                                setState(
                                      () {
                                        isFloatingActionButtonTapped = true;
                                    if (imageSelectedFromGallery != null) {
                                      while (count <
                                          imageSelectedFromGallery!.length) {
                                        abc.add(PhotoUploadedWidget(
                                            onPressed: () {
                                              setState(
                                                    () {
                                                  //abc.removeAt(i);
                                                  //isFile1Uploaded = false;
                                                },
                                              );
                                            },
                                            iconButton: IconButton(
                                                icon: const Icon(null),
                                                onPressed: () {

                                                }
                                            ),
                                            image: imageSelectedFromGallery![count],
                                            imageWidth: 158,
                                            imageHeight: 195));


                                        listOfAuthenticationFiles.add(File(imageSelectedFromGallery![count].path));

                                        count++;
                                      }
                                    }
                                    isLogoVisible = false;
                                  },
                                );
                              },
                            );
                          });
                    },
                    child: Center(
                        child: Icon(
                          FontAwesomeIcons.plus,
                          color: CustomColor.primaryColor,
                          size: 12,
                        )),
                    backgroundColor: const Color(0x80B880FE)),
              ),
            )
          ],
        ),
        body: SafeArea(
          //child: SingleChildScrollView(
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
                              builder: (context) =>
                                  NavBarPagesManager(
                                    selectedIndex: 0,
                                  )),
                        );
                      }),
                  partName: "Claim Found Document ",
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        isFloatingActionButtonTapped?SizedBox(
                          height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height*0.72,
                          child: Scrollbar(
                            child: GridView.count(

                                crossAxisCount: 2,

                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 8.0,
                                children: List.generate(abc.length, (index) {
                                  return Center(
                                    child: GestureDetector(

                                      child: abc[index],
                                      onTap: () {
                                        setState(() {
                                          i = index;
                                          //print(i);
                                          abc.removeAt(i);
                                          listOfAuthenticationFiles.removeAt(i);
                                        });
                                      },
                                    ),
                                  );
                                })),
                          ),
                        ):SizedBox(
                            height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height*0.57,
                        ),

                        //const SizedBox(height: 30,),

                        Visibility(
                          visible: isLogoVisible,
                          child: const SizedBox(
                            height: 30,
                            child: Image(
                              image: AssetImage('assets/images/small_logo.png'),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        const Text(
                          'Verification Proofs',
                          style:
                          TextStyle(fontSize: 14, color: Color(0xFF49454F)),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        const Text(
                          'Please upload documents that can authenticate you are the owner of the claimed document',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),

                        const SizedBox(
                          height: 100,
                        ),

                        CustomizedTextButton(
                          text: 'Submit',
                          buttonWidth: 160,
                          buttonHeight: 40,
                          border: 'border',
                          textColor: Colors.white,
                          textFontSize: 14,
                          backgroundColor: CustomColor.primaryColor,
                          onPressed: () async {
                            LoadingIndicator(context).startLoading();
                             var i = 0;
                             var url;


                             List<String>list = [];
                             print('listOfAuthenticationFiles.length: '+ listOfAuthenticationFiles.length.toString());
                             while(i<listOfAuthenticationFiles.length){
                               if(extension(listOfAuthenticationFiles[i].path).compareTo('.pdf')<0||extension(listOfAuthenticationFiles[i].path).compareTo('.doc')<0){
                                 final ref = FirebaseStorage.instance.ref().child("claimedFoundDocumentsAuthenticationFiles").child("claimFound"+i.toString()+FirebaseAuth.instance.currentUser!.uid+' '+widget.idDocument+".jpg");
                                 await ref.putFile(listOfAuthenticationFiles[i]);
                                 url = await ref.getDownloadURL();
                                 list.add(url);
                               }
                               else{

                                 if(extension(listOfAuthenticationFiles[i].path).compareTo('.doc')<0){
                                   final ref = FirebaseStorage.instance.ref().child("claimedFoundDocumentsAuthenticationFiles").child("claimFound"+FirebaseAuth.instance.currentUser!.uid+' '+widget.idDocument+".pdf");
                                   await ref.putFile(listOfAuthenticationFiles[i]);
                                   url = await ref.getDownloadURL();
                                   list.add(url);

                                 }
                                 else{
                               final ref = FirebaseStorage.instance.ref().child("claimedFoundDocumentsAuthenticationFiles").child("claimFound"+FirebaseAuth.instance.currentUser!.uid+' '+widget.idDocument+".doc");
                               await ref.putFile(listOfAuthenticationFiles[i]);
                               url = await ref.getDownloadURL();
                               list.add(url);

                               }
                               }

                               i++;

                             }


                            ClaimDocumentModel claimDocumentModel = ClaimDocumentModel(
                                idUser: FirebaseAuth.instance.currentUser!.uid,
                                idDocument: widget.idDocument,
                                listOfAuthenticationFiles: list,
                                idClaimDocument: '',
                              documentState: 'Found Document',);



                            await ClaimDocumentController().addClaimedDocument(claimDocumentModel);

                            LoadingIndicator(context).stopLoading();



                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return FoundNotificationDialog(
                                    message: 'Please bring the document to Messassi ICT university'
                                        ' along with the reward code we will send to you now through sms in order to claim your reward',
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NavBarPagesManager(
                                                    selectedIndex: 0)),
                                      );
                                    },

                                  );
                                });
                          },

                        )
                      ],
                    ),
                  ),

                ),
              ],
            ),
          //),
        ));
  }
}
