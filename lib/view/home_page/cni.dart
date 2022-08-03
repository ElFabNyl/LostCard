import 'package:flutter/material.dart';
import '../reusable_widgets/custom_card_widget.dart';

class Cni extends StatefulWidget {
  const Cni({Key? key}) : super(key: key);

  @override
  CniState createState() => CniState();
}

class CniState extends State<Cni> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: const  [
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
          'CNI',
          imageName: 'paul.png',
          address: ' Lost at Messassi',
          date: '10/11/21',
          ownerName: 'Vin Diesel',
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
          ownerName: 'John Doe',
        ),

        SizedBox(
          height: 20,
        ),



      ],
    ));
  }
}
