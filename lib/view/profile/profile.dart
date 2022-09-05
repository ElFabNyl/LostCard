import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lostcard/model/user.dart';
import 'package:lostcard/utils/profile_info_container_clipper.dart';
import 'package:lostcard/view/profile/modify_profile_dialog.dart';
import 'package:lostcard/view/reusable_widgets/customized_modify_textfield.dart';

import '../../constant/custom_color.dart';
import '../../controllers/user_controller.dart';
import '../../utils/manage_image_and_file.dart';
import '../reusable_widgets/app_part_container.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  
  TextEditingController updateController = TextEditingController();

  XFile? image1 = XFile('');
  DocumentSnapshot? user;

  @override
  void initState() {
    // TODO: implement initState
    UserController().getUser().get().then((result) {
      setState(() {
        user = result;
      });
    });
    super.initState();
  }

  // setProfilePicture()async{
  //   this.image1 = await
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainer(
                backButton: IconButton(
                  icon: const Icon(null),
                  onPressed: () {},
                ),
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
                            left:
                                (MediaQuery.of(context).size.width * 0.5) - 75,
                            //top: MediaQuery.of(context).size.height*0.02,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.grey,
                              foregroundImage: FileImage(File(image1!.path)),
                              backgroundImage:user!=null&&(UserModel.fromJson(user?.data()
                            as Map<String, dynamic>)
                              .profilePicture).compareTo('')!=0? NetworkImage(
                                UserModel.fromJson(user!.data()
                                as Map<String, dynamic>)
                                    .profilePicture,

                              ):null ,
                              child:  user!=null&&(UserModel.fromJson(user?.data()
                              as Map<String, dynamic>)
                                  .profilePicture).compareTo('')==0?Icon(
                                FontAwesomeIcons.solidUser,
                                color: CustomColor.primaryColor,
                              ):null,

                              //AssetImage('assets/images/nathalie.png')
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.11,
                            //alignment: Alignment.topCenter,
                            child: ClipPath(
                              clipper: ProfileInfoContainerClipper(),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 40,
                                height: 80,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xFFFFD8EE),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const Align(
                                            alignment: Alignment.centerLeft,
                                            child:  Text(
                                              'Documents Found',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                        // SizedBox(width: 20,),
                                        Align(
                                          child:user!=null? Text(
                                            UserModel.fromJson(user!.data()
                                            as Map<String, dynamic>)
                                                .documentsFound,
                                            style: TextStyle(
                                                color: CustomColor.primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ):null,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                         Align(
                                            alignment: Alignment.centerLeft,
                                            child: user!=null? const Text(
                                             'Rewards Gained',
                                              style:  TextStyle(
                                                fontSize: 14,
                                              ),
                                            ):null),
                                        // SizedBox(width: 20,),
                                        Align(
                                          child:user!=null?Text(
                                              UserModel.fromJson(user!.data()
                                              as Map<String, dynamic>)
                                                  .rewardsGained,
                                            style: TextStyle(
                                                color: CustomColor.primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ):null,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.085,
                            left: (MediaQuery.of(context).size.width * 0.5),
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
                                  icon: Icon(
                                    FontAwesomeIcons.camera,
                                    color: CustomColor.primaryColor,
                                    size: 15,
                                  ),
                                  tooltip: 'Take a picture',
                                  onPressed: () async {
                                    var image = await ManageImageAndFile()
                                        .getImageByCamera();
                                    if (image != null) {

                                      final ref = FirebaseStorage.instance.ref().child("usersProfileImages").child(DateTime.now().toString()+FirebaseAuth.instance.currentUser!.uid+".jpg");
                                      await ref.putFile(File(image.path));
                                      var imageUrl = await ref.getDownloadURL();
                                      await UserController().updateUserProfilePicture(FirebaseAuth.instance.currentUser!.uid, imageUrl);
                                      setState(() {});
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
                        width: 350,
                        height: 52,
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidUser,
                          color: CustomColor.primaryColor,
                          size: 15,
                        ),
                        hintText: user != null
                            ? UserModel.fromJson(
                                    user!.data() as Map<String, dynamic>)
                                .name
                            : null,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ModifyProfileDialog(
                                  updateController: updateController,
                                  title: 'Enter your Name',
                                  hintText: user != null
                                      ? UserModel.fromJson(user!.data()
                                              as Map<String, dynamic>)
                                          .name
                                      : '', 
                                  onSavePressed: () async{
                                    await UserController().updateUserName(FirebaseAuth.instance.currentUser!.uid, updateController.value.text);
                                    
                                    Navigator.of(context).pop();
                                  }, 
                                  onCancelPressed: () {
                                    Navigator.of(context).pop();
                                  },
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
                        hintText: user != null
                            ? UserModel.fromJson(
                                    user!.data() as Map<String, dynamic>)
                                .emailAddress
                            : null,
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidUser,
                          color: CustomColor.primaryColor,
                          size: 15,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ModifyProfileDialog(
                                  title: 'Enter Email Address',
                                  hintText: user != null
                                      ? UserModel.fromJson(user!.data()
                                              as Map<String, dynamic>)
                                          .emailAddress
                                      : '', 
                                  onSavePressed: () {
                                    
                                    Navigator.of(context).pop();
                                  }, 
                                  onCancelPressed: () {
                                    Navigator.of(context).pop();
                                  }, updateController: updateController,
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
                                return  ModifyProfileDialog(
                                  updateController: updateController,
                                    title: 'Enter Password',
                                    hintText: 'xxxxxxxxxxx', 
                                  onCancelPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  onSavePressed: () {
                                    Navigator.of(context).pop();
                                  },);
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
                        width: 350,
                        height: 52,
                        hintText: user != null
                            ? UserModel.fromJson(
                                    user!.data() as Map<String, dynamic>)
                                .phoneNumber
                            : null,
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
                                return ModifyProfileDialog(
                                  updateController: updateController,
                                  hintText: user != null
                                      ? UserModel.fromJson(user!.data()
                                              as Map<String, dynamic>)
                                          .phoneNumber
                                      : '',
                                  title: 'Phone Number',
                                  onSavePressed: () async{
                                    await  UserController().updateUserPhoneNumber(FirebaseAuth.instance.currentUser!.uid, updateController.value.text);
                                    setState((){});
                                  Navigator.of(context).pop();
                                },
                                  onCancelPressed: () {
                                    Navigator.of(context).pop();
                                  },
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
