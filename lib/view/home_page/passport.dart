import 'package:flutter/material.dart';

import '../reusable_widgets/list_view_builder.dart';


class Passport extends StatefulWidget {
  List<Widget> list;
  Passport({Key? key,
  required this.list}) : super(key: key);

  @override
  PassportState createState() => PassportState();
}

class PassportState extends State<Passport> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Container(
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child:   ListViewBuilder(allDocumentsInDatabase:widget.list,)
      ),

    );
  }
}
