import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/utils/manage_image_and_file.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/register_found_document_page/photo_not_uploaded_widget.dart';
import 'package:lostcard/view/register_found_document_page/photo_uploaded_widget.dart';
import 'package:lostcard/view/reusable_widgets/app_part_container.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/dropdown_document_type.dart';
import 'package:lostcard/view/reusable_widgets/loading_indicator.dart';
import '../../controllers/document_controller.dart';
import '../../model/document_model.dart';
import '../reusable_widgets/custom_found_notification_dialog.dart';

class RegisterFoundDocumentPage extends StatefulWidget {
  const RegisterFoundDocumentPage({Key? key}) : super(key: key);

  @override
  RegisterFoundDocumentPageState createState() =>
      RegisterFoundDocumentPageState();
}

class RegisterFoundDocumentPageState extends State<RegisterFoundDocumentPage> {

  String dropDownValue = 'Select Document type';

  DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day) ;


  String registrationDate = DateTime.now().year.toString()+' - '+DateTime.now().month.toString()+' - '+DateTime.now().day.toString();


  List<File>listOfAuthenticationFiles = [];
  late List<XFile>? imageSelectedFromGallery;
  List<String>finalList = [];
  XFile? imageRecto = XFile('');
  File? documentRecto = File('');
  File? documentVerso = File('');
  XFile? imageVerso = XFile('');
  String documentImageUrl = '';
  final imagePicker = ImagePicker();

  bool isNotFilledWithImageRecto = true;

  bool isNotFilledWithImageVerso = true;
  var addressController = TextEditingController();

  var ownerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainer(
                backButton: IconButton(
                    icon: Icon(FontAwesomeIcons.angleLeft,
                      color: CustomColor.primaryColor,),
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
                partName: "Register Found Document ",),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                     DropDownDocumentType(
                       dropDownValue: dropDownValue,
                        onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    }),

                    const SizedBox(
                      height: 20,
                    ),


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
                              imageWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.42,
                              imageHeight: 195,
                              image: imageRecto,
                              onPressed: () {
                                setState(() {
                                  isNotFilledWithImageRecto = true;
                                });
                              },
                              iconButton: IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.xmark, color: Colors.blue,
                                    size: 15,),
                                  onPressed: () {
                                    setState(() {
                                      isNotFilledWithImageRecto = true;
                                    });
                                  }
                              ),
                            )

                        ),

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
                              imageWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.42,
                              imageHeight: 195,
                              image: imageVerso,
                              onPressed: () {
                                setState(() {
                                  isNotFilledWithImageVerso = true;
                                });
                              },
                              iconButton: IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.xmark, color: Colors.blue,
                                    size: 15,),
                                  onPressed: () {
                                    setState(() {
                                      isNotFilledWithImageVerso = true;
                                    });
                                  }
                              ),
                            )


                        ),

                      ],),

                    const SizedBox(
                      height: 40,
                    ),


                    CustomizedTextField(
                      controller: ownerNameController,
                      labelText: 'Enter Owner Name',
                      prefixIcon: Icon(FontAwesomeIcons.solidUser,
                          color: CustomColor.primaryColor, size: 15),
                      suffixIcon: const Icon(null),
                      suffixIconBeforeTap: const Icon(null),
                      suffixIconOnTap: const Icon(null),
                      isStringInputType: true,
                      isPassword: false,
                      width: 343,
                      height: 52,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomizedTextField(
                      controller: addressController,
                      labelText: 'Enter address where found',
                      prefixIcon: Icon(FontAwesomeIcons.solidAddressBook,
                          color: CustomColor.primaryColor, size: 15),
                      suffixIcon: const Icon(null),
                      suffixIconBeforeTap: const Icon(null),
                      suffixIconOnTap: const Icon(null),
                      isStringInputType: true,
                      isPassword: false,
                      width: 343,
                      height: 52,
                    ),



                    const SizedBox(
                      height: 60,
                    ),


                    CustomizedTextButton(
                      text: 'Register',
                      buttonWidth: 247,
                      buttonHeight: 43,
                      border: "border",
                      textColor: Colors.white,
                      textFontSize: 16,
                      backgroundColor: CustomColor.primaryColor,
                      onPressed: () async {

                        print('List of authnetication files is: '+listOfAuthenticationFiles.length.toString());
                        int i = 0;
                        LoadingIndicator(context).startLoading();
                        while(i< listOfAuthenticationFiles.length){
                          final ref = FirebaseStorage.instance.ref().child("foundDocumentImages").child(i.toString()+DateTime.now().toString()+FirebaseAuth.instance.currentUser!.uid+".jpg");
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

                        final documentModel = DocumentModel(
                            idUser: FirebaseAuth.instance.currentUser!.uid,
                            idDocument: '',
                            name: ownerNameController.value.text,
                            address: 'Found at: '+addressController.value.text,
                            listOfFiles: finalList,
                            documentType: dropDownValue,
                            registrationDate: registrationDate,
                            documentState:'Found Document' );

                        await DocumentController()
                            .addFoundDocument(documentModel);



                        LoadingIndicator(context).stopLoading();

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return FoundNotificationDialog(
                                message: 'Please bring the document to Messassi ICT university'
                                    ' along with the reward code we will send to you now through sms in order to claim your reward',
                                onPressed: ()  {

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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
