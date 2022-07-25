
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/profile/profile.dart';
import 'package:lostcard/view/reusable_widgets/add_lost_or_found_card_dialog.dart';

import '../../constant/custom_color.dart';
import '../Rewards/rewards.dart';
import '../home_page/home_page.dart';
import '../search_result_page/search_result.dart';

class NavBarPagesManager extends StatefulWidget{
  int selectedIndex ;
  @override
  NavBarPagesManager({
    required this.selectedIndex,
});

  NavBarPagesManagerState createState() => NavBarPagesManagerState(selectedIndex:selectedIndex);

}

class NavBarPagesManagerState extends State<NavBarPagesManager>{
  @override

  int selectedIndex ;
  NavBarPagesManagerState({required this.selectedIndex});



   var widgetOptions = [
    HomePage(),
    SearchResult(searchInput: ''),
    Rewards(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

  }


  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColor().IconsColor),
    actions: <Widget>[

      Badge(
        position: BadgePosition.topEnd(top: 10, end: 10),
        badgeContent: const Text(
          '2',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
        child: IconButton(
          icon:  Icon(FontAwesomeIcons.solidBell, color: CustomColor().IconsColor, size: 15,),
          tooltip: 'Notifications',
          onPressed: () {},
        ),
      ),

     //IconButton
    IconButton(
    icon:  ClipRRect(borderRadius: BorderRadius.circular(50.0), child: Image.asset('assets/images/paul.png',height: 50.0,
        width: 50.0,
        fit:BoxFit.cover)),
    tooltip: 'Profile',
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile(numberOfDocumentsFound: '12')),
      );
    },
    ), //IconButton
    ], //<Widget>[]
    backgroundColor: Colors.white,
    //elevation: 50.0,
    // leading: IconButton(
    //   icon: Icon(FontAwesomeIcons.bars,color: CustomColor().IconsColor,size: 15,),
    //   tooltip: 'Menu Icon',
    //   onPressed: () {},
    // ),


    ),


    drawer: Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children:  <Widget>[
    DrawerHeader(
    decoration: BoxDecoration(
    color: CustomColor().IconsColor,
    ),
    child: const Text(
    'L O S T  C A R D',
    style: TextStyle(
    color: Colors.white,
    fontSize: 24,
    ),
    ),
    ),
    ListTile(
    leading: Icon(FontAwesomeIcons.info, color: CustomColor().IconsColor,size: 15,),
    title: const Text('News Feed', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
    ),
    ListTile(
    leading: Icon(FontAwesomeIcons.users, color: CustomColor().IconsColor,size: 15,),
    title: const Text('Invite friends',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
    ),
    ListTile(
    leading: Icon(FontAwesomeIcons.gear, color: CustomColor().IconsColor,size: 15,),
    title: const Text('Settings',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
    ),
    ListTile(
    leading: Icon(FontAwesomeIcons.question, color: CustomColor().IconsColor,size: 15,),
    title: const Text('Help',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
    ),
    ],
    ),
    ),


    floatingActionButton: Align(
    alignment: Alignment.bottomRight,
    child: SizedBox(
    width:70,
    height: 70,
    child: FloatingActionButton.large(
    onPressed: () {
      showDialog(context: context,
          builder: (BuildContext context){
            return AddLostFoundCardDialog();
          }
      );



    },
    child: const Icon(FontAwesomeIcons.plus),
    backgroundColor: CustomColor().IconsColor
    ,
    ),
    ),
    ),
    //floatingActionButtonLocation:    FloatingActionButtonLocation.startFloat,





    bottomNavigationBar: BottomNavigationBar(
    backgroundColor: CustomColor().IconsColor,
    items:const [


    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house, ), label: 'Home', backgroundColor: Colors.white),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.signsPost, ), label: 'Posts'),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.gift,), label: 'Rewards')

    ],
    currentIndex: selectedIndex,
    selectedItemColor: Colors.white,
    unselectedItemColor: Color(0x70FFFFFF),
    onTap: _onItemTapped,) ,

    backgroundColor: Colors.white,

    body:widgetOptions.elementAt(selectedIndex),

    );



    throw UnimplementedError();
  }

}