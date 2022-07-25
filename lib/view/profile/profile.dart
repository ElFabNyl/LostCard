import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/profile/modify_profile_dialog.dart';
import 'package:lostcard/view/reusable_widgets/customized_modify_textfield.dart';

import '../../constant/custom_color.dart';
import '../reusable_widgets/app_part_container.dart';
import '../reusable_widgets/customized_text_field.dart';

class Profile extends StatefulWidget {
  String numberOfDocumentsFound;

  Profile({Key? key,
    required this.numberOfDocumentsFound

}) : super(key: key);
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainer(partName: "Profile "),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Number of Documents Found',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 20,
                    ),

                    Align(
                      alignment: Alignment.center,
                        child: Container(
                          decoration: const BoxDecoration(
                            color:  Color(0xFF023607),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(widget.numberOfDocumentsFound,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),

                          ),
                        ),
                    ),


                    const SizedBox(height: 10,),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 158,
                        height: 158,
                        decoration: const BoxDecoration(
                          color:  Color(0x10023607),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 72,
                            height: 72,
                            decoration: const BoxDecoration(
                              color:  Color(0x10023607),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(10),
                            child:  Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon:  Icon(FontAwesomeIcons.camera, color: CustomColor().IconsColor, size: 25,),
                                tooltip: 'Take a picture',
                                onPressed: () {

                                },
                              ),
                            ),
                          ),
                      ),
                        ),
                    ),

                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),


                    CustomizedModifyTextField(

                      //controller: searchController,
                      width: 350,
                      height: 52,
                      prefixIcon: Icon(FontAwesomeIcons.solidUser, color: CustomColor().IconsColor,size: 15,),
                      onPressed: (){

                        showDialog(context: context,
                            builder: (BuildContext context){
                          return ModifyProfileDialog(title: 'Enter your Name',hintText: 'Kuissu Nathalie',);
                        });

                      }),
                    const SizedBox(
                      height: 20,
                    ),

                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),




                    CustomizedModifyTextField(

                      //controller: searchController,
                        width: 350,
                        height: 52,
                        prefixIcon: Icon(FontAwesomeIcons.solidUser, color: CustomColor().IconsColor,size: 15,),
                        onPressed: (){

                          showDialog(context: context,
                              builder: (BuildContext context){
                                return ModifyProfileDialog(title: 'Enter Email Address',hintText: 'kuissunathalie@gmailcom',);
                              });

                        }),

                    const SizedBox(
                      height: 20,
                    ),

                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),




                    CustomizedModifyTextField(

                      //controller: searchController,
                        width: 350,
                        height: 52,
                        prefixIcon: Icon(FontAwesomeIcons.solidUser, color: CustomColor().IconsColor,size: 15,),
                        onPressed: (){

                          showDialog(context: context,
                              builder: (BuildContext context){
                                return ModifyProfileDialog(title: 'Enter Password',hintText: 'xxxxxxxxxxx');
                              });

                        }),


                    const SizedBox(
                      height: 20,
                    ),

                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),




                    CustomizedModifyTextField(

                      //controller: searchController,
                        width: 350,
                        height: 52,
                        labelText: 'Phone Number',
                        prefixIcon: Icon(FontAwesomeIcons.phone, color: CustomColor().IconsColor,size: 15,),
                        onPressed: (){

                          showDialog(context: context,
                              builder: (BuildContext context){
                                return ModifyProfileDialog(title: 'Enter Phone Number',  hintText: 'Phone Number',);
                              });

                        }),



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
