import 'package:flutter/material.dart';
import '../reusable_widgets/custom_card_widget.dart';
import '../reusable_widgets/list_view_builder.dart';

class Cni extends StatefulWidget {
  List<Widget> list;
  bool isCniFound;
   Cni({Key? key,
  required this.list,
   required this.isCniFound,
   }) : super(key: key);

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
          child:  !widget.isCniFound? ListViewBuilder(allDocumentsInDatabase:widget.list,)
              :const Center(child: Text('No items'))),

    );
  }
}
