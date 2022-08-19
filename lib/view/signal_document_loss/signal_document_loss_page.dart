import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/reusable_widgets/app_part_container.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';

import '../../utils/manage_image_and_file.dart';
import '../claim_found_document/Document_uploaded_widget.dart';
import '../register_found_document_page/photo_uploaded_widget.dart';
import '../reusable_widgets/choose_upload_medium_dialog.dart';
import '../reusable_widgets/custom_found_notification_dialog.dart';
import '../reusable_widgets/dropdown_document_type.dart';

class SignalDocumentLossPage extends StatefulWidget {
  const SignalDocumentLossPage({Key? key}) : super(key: key);

  @override
  SignalDocumentLossPageState createState() => SignalDocumentLossPageState();
}

class SignalDocumentLossPageState extends State<SignalDocumentLossPage> {

  late XFile? image;
  late List<XFile> documentSelected;
  final imagePicker = ImagePicker();
  bool isFile1Uploaded = false;
  bool isFile2Uploaded = false;
  bool isFile3Uploaded = false;
  late List<XFile>? imageSelectedFromGallery ;

  bool isLogoVisible = true;

  List<Widget> abc = [];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                          iconButton:IconButton(
                                              icon:  const Icon(null),
                                              onPressed:  () {

                                              }
                                          ),
                                          image: documentSelected[count],
                                          imageWidth: MediaQuery.of(context).size.width*0.42,
                                          imageHeight: 100));
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
                                      imageWidth: MediaQuery.of(context).size.width*0.42,
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
                                      iconButton:IconButton(
                                          icon:  const Icon(null),
                                          onPressed:  () {

                                          }
                                      ),
                                    ));
                                  },
                                );
                              },
                              onTapGallery: () async {
                                imageSelectedFromGallery = await ManageImageAndFile()
                                    .getImageByGallery();
                                var count = 0;
                                setState(
                                  () {
                                    if(imageSelectedFromGallery!=null){
                                      while (count < imageSelectedFromGallery!.length) {
                                        abc.add(PhotoUploadedWidget(
                                            onPressed: () {
                                              print(i);
                                              setState(
                                                    () {

                                                  //abc.removeAt(i);
                                                  //isFile1Uploaded = false;
                                                },
                                              );
                                            },
                                            iconButton:IconButton(
                                                icon:  const Icon(null),
                                                onPressed:  () {

                                                }
                                            ),
                                            image: imageSelectedFromGallery![count],
                                            imageWidth: 158,
                                            imageHeight: 100));
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
                    const DropDownDocumentType(),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomizedTextField(
                      //controller: emailController,
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
                      //controller: emailController,
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
                              color: Color(0xFF6B6A6A),),textAlign: TextAlign.center,
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
                        )
                      ),
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
                      text: 'Post',
                      buttonWidth: 247,
                      buttonHeight: 43,
                      border: "border",
                      textColor: Colors.white,
                      textFontSize: 16,
                      backgroundColor: CustomColor.primaryColor,
                      onPressed: () {
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
