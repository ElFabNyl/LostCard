
import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';


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



    return Container(
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              children:  [
                const Align(
                  alignment: Alignment.center,
                  child: Image(
                    image:
                    AssetImage('assets/images/cameroon_flag.png'),
                  ),
                ),
                Text(
                  "L O S T  C A R D",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: CustomColor().IconsColor,

                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 68,
                ),



              ],
            ),
          ),
                );
    throw UnimplementedError();
  }
}
