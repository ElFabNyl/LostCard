
import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/search_result_page/search_result.dart';
import '../reusable_widgets/customized_search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }







  @override
  Widget build(BuildContext context) {


    return   Container(
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

              CustomizedSearchField(

                controller: searchController,
                width: 350,
                height: 52,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            (  NavBarPagesManager(selectedIndex: 1,))),
                  );
                },




              )


            ],
          ),
        ),

      );
    throw UnimplementedError();
  }
}
