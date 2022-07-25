

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/register_found_document/register_found_document_pictures.dart';
import 'package:lostcard/view/reusable_widgets/app_part_container.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';

class RegisterFoundDocumentDocumentInformation extends StatefulWidget{
  const RegisterFoundDocumentDocumentInformation({Key? key}) : super(key: key);


  @override
  RegisterFoundDocumentDocumentInformationState createState() =>RegisterFoundDocumentDocumentInformationState();



}

class RegisterFoundDocumentDocumentInformationState extends State<RegisterFoundDocumentDocumentInformation>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainer(partName: "Register Found Document "),

               Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    children: [
                      const SizedBox(height:40),
                      const Align(alignment:Alignment.centerLeft,
                          child: Text('Document Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 40,),
                      CustomizedTextField(
                        //controller: emailController,
                        labelText: 'Enter Owner Name',
                        prefixIcon: Icon(FontAwesomeIcons.solidUser,
                            color: CustomColor().IconsColor, size: 15),
                        suffixIcon: const Icon(null),
                        suffixIconBeforeTap: const Icon(null),
                        suffixIconOnTap: const Icon(null),
                        isStringInputType: true,
                        isPassword: false,
                        width: 343,
                        height: 52,
                        // errorText:
                        // isEmailEmpty ? emailErrorText : null,
                        // onChanged:  (_){
                        //
                        //   emailController.value.text.isEmpty? isEmailEmpty = true : isEmailEmpty = false ;
                        //
                        //   setState(() {
                        //
                        //
                        //   });
                        //
                        //
                        // },
                      ),

                      

                      const SizedBox(height: 40,),
                      CustomizedTextField(
                        //controller: emailController,
                        labelText: 'Enter address where found',
                        prefixIcon: Icon(FontAwesomeIcons.solidAddressBook,
                            color: CustomColor().IconsColor, size: 15),
                        suffixIcon: const Icon(null),
                        suffixIconBeforeTap: const Icon(null),
                        suffixIconOnTap: const Icon(null),
                        isStringInputType: true,
                        isPassword: false,
                        width: 343,
                        height: 52,
                        // errorText:
                        // isEmailEmpty ? emailErrorText : null,
                        // onChanged:  (_){
                        //
                        //   emailController.value.text.isEmpty? isEmailEmpty = true : isEmailEmpty = false ;
                        //
                        //   setState(() {
                        //
                        //
                        //   });
                        //
                        //
                        // },
                      ),


                      const SizedBox(height: 40,),
                      const Align(alignment: Alignment.centerLeft,
                          child: Text('Comments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF6B6A6A)),)),

                      const SizedBox(height: 10,),
                      CustomizedTextField(
                        //controller: emailController,
                        //labelText: 'Enter Owner Name',
                        prefixIcon: const Icon(null),
                        suffixIcon: const Icon(null),
                        suffixIconBeforeTap: const Icon(null),
                        suffixIconOnTap: const Icon(null),
                        isStringInputType: true,
                        isPassword: false,
                        width: 343,
                        height: 141,
                        // errorText:
                        // isEmailEmpty ? emailErrorText : null,
                        // onChanged:  (_){
                        //
                        //   emailController.value.text.isEmpty? isEmailEmpty = true : isEmailEmpty = false ;
                        //
                        //   setState(() {
                        //
                        //
                        //   });
                        //
                        //
                        // },
                      ),

                      const SizedBox(
                        height: 80,
                      ),

                      CustomizedTextButton(
                        text: 'Next',
                        buttonWidth: 247,
                        buttonHeight: 43,
                        border: "border",
                        textColor: Colors.white,
                        textFontSize: 16,
                        backgroundColor: CustomColor().IconsColor,
                        onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterFoundDocumentPictures()),
                          );
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




    throw UnimplementedError();
  }

}