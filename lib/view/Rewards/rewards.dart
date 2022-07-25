
import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/Rewards/get_rewards.dart';
import 'package:lostcard/view/Rewards/rewards_history.dart';


class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  RewardsState createState() => RewardsState();
}

class RewardsState extends State<Rewards> {

  TextEditingController searchController = TextEditingController();

  String searchInput='';


  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }










  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
          leading: new Container(),
          backgroundColor: Colors.white,

        bottom:  const TabBar(
          labelColor: Color(0xFF023607),
        indicatorColor: Color(0xFF023607),
        labelStyle: TextStyle(fontWeight:FontWeight.bold, fontSize: 22),


        tabs: [
    Tab(text: 'Get Rewards',),
    Tab(text: 'Rewards History'),
    ],
    ),
    ),
    body:  TabBarView(
    children: [
      GetRewards(),
    RewardsHistory(),


    ],
    ),));

    throw UnimplementedError();
  }
}
