
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

import '../reusable_widgets/custom_found_notification_dialog.dart';

class RegisterFoundDocumentPage extends StatefulWidget {
  const RegisterFoundDocumentPage({Key? key}) : super(key: key);

  @override
  RegisterFoundDocumentPageState createState() =>
      RegisterFoundDocumentPageState();
}

class RegisterFoundDocumentPageState extends State<RegisterFoundDocumentPage> {

  late XFile? image;
  final imagePicker = ImagePicker();

  bool isNotFilledWithImageRecto = true;

  bool isNotFilledWithImageVerso = true;

  @override
  Widget build(BuildContext context) {
    var addressController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainer(
                backButton: IconButton(
              icon:  Icon(FontAwesomeIcons.angleLeft, color: CustomColor.primaryColor,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  NavBarPagesManager(
                          selectedIndex: 0,
                        )),
                  );
                } ),
                  partName: "Register Found Document ",),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const DropDownDocumentType(),

                    const SizedBox(
                      height: 20,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(

                          child: isNotFilledWithImageRecto? PhotoNotUploadedWidget(
                            onTap: () async{
                              image = await ManageImageAndFile().getImageByCamera();
                              setState(() {
                                if(image!=null) {
                                          isNotFilledWithImageRecto = false;
                                        }
                                      });

                          } ,): PhotoUploadedWidget(
                            imageWidth: MediaQuery.of(context).size.width*0.42,
                            imageHeight: 195,
                            image: image,
                            onPressed: () {
                              setState(() {
                                isNotFilledWithImageRecto = true;

                              });

                            },
                              iconButton:IconButton(
                              icon:  const Icon(FontAwesomeIcons.xmark, color: Colors.blue, size: 15,),
                              onPressed:  () {
                                setState(() {
                                  isNotFilledWithImageRecto = true;

                                });

                              }
                          ),
                          )

                        ),

                        SizedBox(
                            child: isNotFilledWithImageVerso? PhotoNotUploadedWidget(
                              onTap: () async{
                                image = await ManageImageAndFile().getImageByCamera();
                                setState(() {
                                  if(image!=null) {
                                          isNotFilledWithImageVerso = false;
                                        }
                                      });

                              } ,): PhotoUploadedWidget(
                              imageWidth: MediaQuery.of(context).size.width*0.42,
                              imageHeight: 195,
                              image: image,
                              onPressed: () {
                                setState(() {
                                  isNotFilledWithImageVerso = true;

                                });

                              } ,
                              iconButton:IconButton(
                                  icon:  const Icon(FontAwesomeIcons.xmark, color: Colors.blue, size: 15,),
                                  onPressed:  () {
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
                      //controller: emailController,
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
                      controller: addressController ,
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


                    SizedBox(
                      width: 340,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomizedTextButton(
                          text: 'Use map',
                          buttonWidth: 150,
                          buttonHeight: 40,
                          border: 'noBorder',
                          textColor: const Color(0xFFFF37AF),
                          textFontSize: 12,
                          backgroundColor: CustomColor.primaryColor,
                          textAlignment: TextAlign.end,
                          onPressed: () {

                          },
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 40,
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
