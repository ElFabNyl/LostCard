import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/reusable_widgets/app_part_container.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:path/path.dart';
import '../../controllers/document_controller.dart';
import '../../model/document_model.dart';
import '../../utils/manage_image_and_file.dart';
import '../claim_found_document/Document_uploaded_widget.dart';
import '../register_found_document_page/photo_uploaded_widget.dart';
import '../reusable_widgets/choose_upload_medium_dialog.dart';
import '../reusable_widgets/custom_found_notification_dialog.dart';
import '../reusable_widgets/dropdown_document_type.dart';
import '../reusable_widgets/loading_indicator.dart';

class SignalDocumentLossPage extends StatefulWidget {
  const SignalDocumentLossPage({
    Key? key,
  }) : super(key: key);

  @override
  SignalDocumentLossPageState createState() => SignalDocumentLossPageState();
}

class SignalDocumentLossPageState extends State<SignalDocumentLossPage> {
  TextEditingController yourNameController = TextEditingController();
  TextEditingController documentTypeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  String registrationDate = DateTime.now().year.toString() +
      ' - ' +
      DateTime.now().month.toString() +
      ' - ' +
      DateTime.now().day.toString();

  String dropDownValue = 'Select Document type';
  late XFile? image;
  late List<XFile> documentSelected;
  final imagePicker = ImagePicker();
  bool isFile1Uploaded = false;
  bool isFile2Uploaded = false;
  bool isFile3Uploaded = false;
  late List<XFile>? imageSelectedFromGallery;

  List<File> listOfAuthenticationFiles = [];

  bool isLogoVisible = true;

  List<Widget> abc = [];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Stack(children: [
        Positioned(
            bottom: 90,
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
                                    while (count < documentSelected.length) {
                                      abc.add(DocumentUploadedWidget(
                                          onPressed: () {
                                            setState(
                                              () {
                                                //print(i);
                                                //abc.removeAt(i);
                                                //isFile1Uploaded = false;
                                              },
                                            );
                                          },
                                          iconButton: IconButton(
                                              icon: const Icon(null),
                                              onPressed: () {}),
                                          image: documentSelected[count],
                                          imageWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.42,
                                          imageHeight: 100));

                                      listOfAuthenticationFiles.add(
                                          File(documentSelected[count].path));

                                      count++;
                                    }
                                  },
                                );
                              },
                              onTapCamera: () async {
                                image = await ManageImageAndFile()
                                    .getImageByCamera();
                                setState(
                                  () {
                                    abc.add(PhotoUploadedWidget(
                                      imageHeight: 100,
                                      imageWidth:
                                          MediaQuery.of(context).size.width *
                                              0.42,
                                      image: image,
                                      onPressed: () {
                                        setState(
                                          () {
                                            //print(i);
                                            //abc.removeAt(i);
                                            //isFile1Uploaded = false;
                                          },
                                        );
                                      },
                                      iconButton: IconButton(
                                          icon: const Icon(null),
                                          onPressed: () {}),
                                    ));

                                    listOfAuthenticationFiles
                                        .add(File(image!.path));
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
                                                onPressed: () {}),
                                            image: imageSelectedFromGallery![
                                                count],
                                            imageWidth: 158,
                                            imageHeight: 100));

                                        listOfAuthenticationFiles.add(File(
                                            imageSelectedFromGallery![count]
                                                .path));

                                        count++;
                                      }
                                    }
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
                    backgroundColor: const Color(0x80B880FE))))
      ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainer(
                partName: "Signal Document Loss ",
                backButton: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.angleLeft,
                      color: CustomColor.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavBarPagesManager(
                                  selectedIndex: 0,
                                )),
                      );
                    }),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
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
                    CustomizedTextField(
                      controller: yourNameController,
                      labelText: 'Enter your Name',
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
                      height: 20,
                    ),
                    CustomizedTextField(
                      controller: addressController,
                      labelText: 'Enter address where lost',
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
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Upload files that will authenticate you when the document is found.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6B6A6A),
                          ),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      //width: 158,
                      height: 250,
                      decoration: BoxDecoration(
                          //color: const Color(0xFFFBBEE3),
                          borderRadius: BorderRadius.circular(12),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black, width: 0.5),
                            top: BorderSide(color: Colors.black, width: 0.5),
                            left: BorderSide(color: Colors.black, width: 0.5),
                            right: BorderSide(color: Colors.black, width: 0.5),
                          )),
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
                                    abc.removeAt(i);
                                    listOfAuthenticationFiles.removeAt(i);
                                  });
                                },
                              ),
                            );
                          })),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomizedTextButton(
                      text: 'Signal',
                      buttonWidth: 247,
                      buttonHeight: 43,
                      border: "border",
                      textColor: Colors.white,
                      textFontSize: 16,
                      backgroundColor: CustomColor.primaryColor,
                      onPressed: () async {
                        LoadingIndicator(context).startLoading();
                        var i = 0;
                        var url;

                        List<String> list = [];
                        print('listOfAuthenticationFiles.length: ' +
                            listOfAuthenticationFiles.length.toString());
                        while (i < listOfAuthenticationFiles.length) {
                          if (extension(listOfAuthenticationFiles[i].path)
                                      .compareTo('.pdf') <
                                  0 ||
                              extension(listOfAuthenticationFiles[i].path)
                                      .compareTo('.doc') <
                                  0) {
                            final ref = FirebaseStorage.instance
                                .ref()
                                .child("lostDocumentAuthenticationFiles")
                                .child("signalDocumentLoss" +
                                    i.toString() +
                                    FirebaseAuth.instance.currentUser!.uid +
                                    ' ' +
                                    ".jpg");
                            await ref.putFile(listOfAuthenticationFiles[i]);
                            url = await ref.getDownloadURL();
                            list.add(url);
                          } else {
                            if (extension(listOfAuthenticationFiles[i].path)
                                    .compareTo('.doc') <
                                0) {
                              final ref = FirebaseStorage.instance
                                  .ref()
                                  .child("authenticationFiles")
                                  .child("signalDocumentLoss" +
                                      FirebaseAuth.instance.currentUser!.uid +
                                      ' ' +
                                      ".pdf");
                              await ref.putFile(listOfAuthenticationFiles[i]);
                              url = await ref.getDownloadURL();
                              list.add(url);
                            } else {
                              final ref = FirebaseStorage.instance
                                  .ref()
                                  .child("authenticationFiles")
                                  .child("signalDocumentLoss" +
                                      FirebaseAuth.instance.currentUser!.uid +
                                      ' ' +
                                      ".doc");
                              await ref.putFile(listOfAuthenticationFiles[i]);
                              url = await ref.getDownloadURL();
                              list.add(url);
                            }
                          }

                          i++;
                        }

                       DocumentModel documentModel =
                            DocumentModel(
                                idUser: FirebaseAuth.instance.currentUser!.uid,
                                idDocument: '',
                                listOfFiles: list,
                                documentType: dropDownValue,
                                registrationDate: registrationDate,
                                name: yourNameController.value.text,
                                address:
                                    'Lost at: ' + addressController.value.text,
                                documentState: 'Lost Document');

                        await DocumentController()
                            .addFoundDocument(documentModel);

                        LoadingIndicator(context).stopLoading();

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return FoundNotificationDialog(
                                message:
                                    'Please bring the document to Messassi ICT university'
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
