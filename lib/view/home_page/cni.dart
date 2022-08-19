import 'package:flutter/material.dart';
import '../reusable_widgets/custom_card_widget.dart';
import '../reusable_widgets/list_view_builder.dart';

class Cni extends StatefulWidget {
  List<Widget> list;
   Cni({Key? key,
  required this.list}) : super(key: key);

  @override
  CniState createState() => CniState();
}

class CniState extends State<Cni> {
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
