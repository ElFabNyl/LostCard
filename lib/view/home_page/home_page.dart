import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/home_page/passport.dart';
import 'package:lostcard/view/reusable_widgets/floating_acion_button_container.dart';
import '../found_lost_document_page/found_lost_document_page.dart';
import '../reusable_widgets/custom_card_widget.dart';
import '../reusable_widgets/customized_search_field.dart';
import 'all.dart';
import 'cni.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();


  String searchValue = '';

  bool isNotClicked = true;

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list =[
      CustomCard(
        documentType: 'Passport',
        imageName: 'paul.png',
        address: 'Found At Messassi',
        date: '10/11/21',
        ownerName: 'Savio',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FoundLostDocumentPage(
                  ownerName: 'Savio',
                  address: 'Found At Messassi',
                  date: '10/11/21',
                  documentState: 'Found document',
                  documentType: 'Passport',
                  imageName1: 'paul.png',
                  imageName2:'paul.png' ,
                )),
          );
        },
      ),


      CustomCard(
        documentType: 'CNI',
        imageName: 'paul.png',
        address: 'Lost at Messassi',
        date: '10/11/21',
        ownerName: 'Nasaire',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FoundLostDocumentPage(
                  ownerName: 'Savio',
                  address: 'Lost At Messassi',
                  date: '10/11/21',
                  documentState: 'Lost document',
                  documentType: 'CNI',
                  imageName1: 'paul.png',
                  imageName2:'paul.png' ,

                )),
          );
        },

      ),







    ];

    List<Widget>cniList = [];

    List<Widget>passportList = [];


    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: SizedBox(
          width: 50,
          height: 50,

          child: FloatingActionButton.large(

            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const FloatingActionButtonContainer();
                  });
            },
            child: const Icon(
              FontAwesomeIcons.plus,
              size: 15,
            ),
            backgroundColor: CustomColor.primaryColor,

          ),
        ),
        body: SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 77,
            title: Align(
              alignment: Alignment.centerRight,
              child: CustomizedSearchField(
                controller: searchController,
                width: 230,
                height: 49,
                onTapped: (){
                  setState(() {
                    isNotClicked = false;

                  });
                },
                onChanged: (value) {
                    setState(() {
                      //isNotClicked = false;
                      searchValue = value;
                    });

                  }

              ),
            ),
            backgroundColor: Colors.white,

            bottom: isNotClicked&&searchController.value.text.isEmpty?TabBar(
              labelColor: CustomColor.primaryColor,
              indicatorColor: CustomColor.secondaryColor,
              labelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              tabs: const [
                Tab(
                  text: 'All',
                ),
                Tab(text: 'CNI'),
                Tab(text: 'Passport'),
              ],
            ):null
          ),
          body: isNotClicked? TabBarView(
            children: [
              All(list: list),
              Cni(list: cniList,),
              Passport(list: passportList,),
            ],
          ):All(list: list,)
        ),
      ),
    ));
  }
}