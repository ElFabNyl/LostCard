import 'package:flutter/material.dart';

import '../reusable_widgets/custom_card_widget.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  AllState createState() => AllState();
}

class AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 140),
      child: SingleChildScrollView(
        child: Column(
          children:  const [

          CustomCard(
              documentType:
              'Passport',
              imageName: 'paul.png',
              address: 'Found At Messassi',
              date: '10/11/21',
              ownerName: 'Savio',
            ),



            SizedBox(
              height: 20,
            ),


           CustomCard(
              documentType:
              'CNI',
              imageName: 'paul.png',
              address: ' Lost at Messassi',
              date: '10/11/21',
              ownerName: 'Nasaire',
            ),

             SizedBox(
              height: 20,
            ),

            CustomCard(
              documentType:
              'Credit Card',
              imageName: 'paul.png',
              address: ' Lost at Messassi',
              date: '10/11/21',
              ownerName: 'Nasaire',
            ),

            SizedBox(
              height: 20,
            ),

            CustomCard(
              documentType:
              'Passport',
              imageName: 'paul.png',
              address: ' Found at Messassi',
              date: '10/11/21',
              ownerName: 'Nasaire',
            ),

            SizedBox(
              height: 20,
            ),

            CustomCard(
              documentType:
              'Passport',
              imageName: 'paul.png',
              address: ' Found at Messassi',
              date: '10/11/21',
              ownerName: 'Nasaire',
            ),


          ],
        ),
      ),
    );
  }
}
