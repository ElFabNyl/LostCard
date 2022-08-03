import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/profile/modify_profile_dialog.dart';
import 'package:lostcard/view/reusable_widgets/customized_modify_textfield.dart';

import '../../constant/custom_color.dart';
import '../reusable_widgets/app_part_container_with_back_button.dart';

class Profile extends StatefulWidget {
  final String numberOfDocumentsFound;

  const Profile({Key? key, required this.numberOfDocumentsFound})
      : super(key: key);

  @override
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
              AppPartContainerWithBackButton(
                  partName: "Profile ",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavBarPagesManager(
                                selectedIndex: 0,
                              )),
                    );
                  }),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage:
                                  AssetImage('assets/images/nathalie.png')
                              // child: ClipRRect(
                              //   child: Image.asset('assets/images/nathalie.png'),
                              //   borderRadius: BorderRadius.circular(50.0),
                              // ),
                              ),
                        ),
                        Positioned(
                          top: 70,
                          left: 200,
                          child: Container(
                            width: 72,
                            height: 72,
                            decoration: const BoxDecoration(
                              color: Color(0x10023607),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.camera,
                                  color: CustomColor.primaryColor,
                                  size: 25,
                                ),
                                tooltip: 'Take a picture',
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Number of Documents Found',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        // SizedBox(width: 20,),
                        Text(
                          '15',
                          style: TextStyle(
                              color: CustomColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Number of rewards_history gained',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )),
                        // SizedBox(width: 20,),
                        Text(
                          '10',
                          style: TextStyle(
                              color: CustomColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                              fontSize: 20, fontWeight: FontWeight.bold),
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
