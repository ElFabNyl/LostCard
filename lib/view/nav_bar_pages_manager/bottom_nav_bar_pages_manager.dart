import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/profile/profile.dart';
import '../../constant/custom_color.dart';
import '../rewards_history/rewards_history.dart';
import '../home_page/home_page.dart';

class NavBarPagesManager extends StatefulWidget {
  int selectedIndex;

  @override
  NavBarPagesManager({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  NavBarPagesManagerState createState() => NavBarPagesManagerState();
}

class NavBarPagesManagerState extends State<NavBarPagesManager> {
  var widgetOptions = [
    const HomePage(),
    const RewardsHistory(),
    const Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColor.primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
              ),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.gift,
              ),
              label: 'Reward History'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidUser,
              ),
              label: 'Profile')
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0x70FFFFFF),
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.white,
      body: widgetOptions.elementAt(widget.selectedIndex),
    );
  }
}
