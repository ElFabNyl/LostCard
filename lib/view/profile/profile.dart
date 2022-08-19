import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostcard/utils/profile_info_container_clipper.dart';
import 'package:lostcard/view/profile/modify_profile_dialog.dart';
import 'package:lostcard/view/reusable_widgets/customized_modify_textfield.dart';

import '../../constant/custom_color.dart';
import '../../utils/manage_image_and_file.dart';
import '../reusable_widgets/app_part_container.dart';

class Profile extends StatefulWidget {
  final String numberOfDocumentsFound;

  const Profile({Key? key, required this.numberOfDocumentsFound})
      : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {

  XFile? image = XFile('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainer(
                backButton: IconButton(icon: const Icon(null), onPressed: (){},),
                  partName: "Profile ",
                 ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                          SizedBox(
                             height: 160,
                             //width: 340,
                               child: Stack(
                                  children: [
                                     Positioned(
                                      left:(MediaQuery.of(context).size.width*0.5)-75,
                                      //top: MediaQuery.of(context).size.height*0.02,
                                      child:  CircleAvatar(
                                            radius: 50.0,
                                            backgroundColor: Colors.grey,
                                            foregroundImage: FileImage(File(image!.path)),
                                            child: Icon(FontAwesomeIcons.solidUser, color: CustomColor.primaryColor,),


                                            //AssetImage('assets/images/nathalie.png')

                                        ),
                                    ),

                                    Positioned(
                                      top: MediaQuery.of(context).size.height*0.11,
                                      //alignment: Alignment.topCenter,
                                      child: ClipPath(
                                        clipper: ProfileInfoContainerClipper(),
                                        child: Container(

                                          width: MediaQuery.of(context).size.width-40,
                                          height: 80,
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),
                                            color: const Color(0xFFFFD8EE),

                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              Column(children: [
                                                const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      'Documents Found',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                                // SizedBox(width: 20,),
                                                Text(
                                                  '15',
                                                  style: TextStyle(
                                                      color: CustomColor.primaryColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18),
                                                )

                                              ],),

                                              Column(children: [
                                                const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      'Rewards Gained',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                                // SizedBox(width: 20,),
                                                Text(
                                                  '9000 Fcfa',
                                                  style: TextStyle(
                                                      color: CustomColor.primaryColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18),
                                                )

                                              ],)


                                            ],
                                          ),

                                        ),

                                      ),
                                    ),


                                    Positioned(
                                      top: MediaQuery.of(context).size.height*0.085,
                                      left: (MediaQuery.of(context).size.width*0.5),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Color(0x20023607),
                                          shape: BoxShape.circle,
                                        ),
                                        //padding: const EdgeInsets.all(10),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            icon:  Icon(
                                              FontAwesomeIcons.camera,
                                              color: CustomColor.primaryColor,
                                              size: 15,
                                            ),
                                            tooltip: 'Take a picture',
                                            onPressed: () async{
                                              image = await ManageImageAndFile().getImageByCamera();
                                              if(image!=null){
                                                setState(() {

                                                });
                                              }




                                            },
                                          ),
                                        ),
                                      ),
                                    ),




                                  ],
                                ),
                            ),















                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    CustomizedModifyTextField(

                        //controller: searchController,
                        width: 350,
                        height: 52,
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidUser,
                          color: CustomColor.primaryColor,
                          size: 15,
                        ),
                        hintText: 'Kuissu Nathalie',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ModifyProfileDialog(
                                  title: 'Enter your Name',
                                  hintText: 'Kuissu Nathalie',
                                );
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
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    CustomizedModifyTextField(

                        //controller: searchController,
                        width: 350,
                        height: 52,
                        hintText: 'kuissunathalie@gmail.com',
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidUser,
                          color: CustomColor.primaryColor,
                          size: 15,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ModifyProfileDialog(
                                  title: 'Enter Email Address',
                                  hintText: 'kuissunathalie@gmailcom',
                                );
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
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    CustomizedModifyTextField(

                        //controller: searchController,
                        width: 350,
                        height: 52,
                        hintText: 'xxxxxxxxxxxx',
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidUser,
                          color: CustomColor.primaryColor,
                          size: 15,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ModifyProfileDialog(
                                    title: 'Enter Password',
                                    hintText: 'xxxxxxxxxxx');
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
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    CustomizedModifyTextField(

                        //controller: searchController,
                        width: 350,
                        height: 52,
                        hintText: "693306986",
                        labelText: 'Phone Number',
                        prefixIcon: Icon(
                          FontAwesomeIcons.phone,
                          color: CustomColor.primaryColor,
                          size: 15,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ModifyProfileDialog(
                                  title: 'Enter Phone Number',
                                  hintText: '693306986',
                                );
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
  }
}
