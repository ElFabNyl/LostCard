import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/claim_found_document/claim_found_document.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import '../claim_lost_document/claim_lost_document.dart';
import '../nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';

class FoundLostDocumentPage extends StatefulWidget {
  final String documentState;
  final String imageName1;
  final String imageName2;
  final String address;
  final String date;
  final String documentType;
  final String ownerName;

  const FoundLostDocumentPage({
    Key? key,
    required this.documentState,
    required this.imageName1,
    required this.imageName2,
    required this.address,
    required this.date,
    required this.documentType,
    required this.ownerName,
  }) : super(key: key);

  @override
  FoundLostDocumentPageState createState() => FoundLostDocumentPageState();
}

class FoundLostDocumentPageState extends State<FoundLostDocumentPage> {

@override



  @override
  Widget build(BuildContext context) {
    List imgList = ['assets/images/file_searching.png', 'assets/images/paul.png'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            //color: Colors.white,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.documentState,
                          style: TextStyle(
                              fontSize: 16,
                              color: CustomColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.documentType,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ))
                  ],
                )),
            SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 255,
                  color: const Color(0xFFFFE3F4),
                  child:  CarouselSlider(

                    items: imgList.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                            ),
                            child: Image.asset(
                              imgUrl,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(autoPlay: false),
                  ),


                ),

                const SizedBox(
                  height: 40,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              const Text(
                                'Name:',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                widget.ownerName,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF49454F),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.address,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF49454F),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              const Text(
                                'Date',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                widget.date,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF49454F),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomizedTextButton(
                              text: 'Cancel',
                              buttonWidth: 92,
                              buttonHeight: 40,
                              border: "border",
                              textColor: CustomColor.primaryColor,
                              textFontSize: 14,
                              backgroundColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavBarPagesManager(
                                            selectedIndex: 0,
                                          )),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomizedTextButton(
                              text: 'Claim',
                              buttonWidth: 92,
                              buttonHeight: 40,
                              border: "border",
                              textColor: Colors.white,
                              textFontSize: 14,
                              backgroundColor: CustomColor.primaryColor,
                              onPressed: () {

                                if(widget.documentState.compareTo('Found document')==0){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ClaimFoundDocument()));

                                }
                                else{
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) =>
                                  const ClaimLostDocument()));

                                  }


                                }

                              ,
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            )),
          ],
        )),
      ),
    );
  }
}
