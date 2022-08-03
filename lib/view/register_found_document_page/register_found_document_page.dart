import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/register_found_document_page/photo_not_uploaded_widget.dart';
import 'package:lostcard/view/reusable_widgets/app_part_container_with_back_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/dropdown_document_type.dart';

class RegisterFoundDocumentPage extends StatefulWidget {
  const RegisterFoundDocumentPage({Key? key}) : super(key: key);

  @override
  RegisterFoundDocumentPageState createState() =>
      RegisterFoundDocumentPageState();
}

class RegisterFoundDocumentPageState
    extends State<RegisterFoundDocumentPage> {

  bool isFilledWithImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainerWithBackButton(
                  partName: "Register Found Document ",
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  NavBarPagesManager(
                                selectedIndex: 0,
                              )),
                    );
                  }),
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
                        Container(
                          width: 158,
                          height: 195,

                          decoration: BoxDecoration(
                              color: const Color(0xFFFBBEE3),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: isFilledWithImage?const PhotoNotUploadedWidget():const PhotoNotUploadedWidget()

                        ),

                        Container(
                          width: 158,
                          height: 195,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFBBEE3),
                                borderRadius: BorderRadius.circular(12)
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
                      //controller: emailController,
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
                          text: 'Use google map',
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
                        Navigator.of(context).pop();
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
