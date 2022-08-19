import 'package:flutter/material.dart';
import 'package:lostcard/view/reusable_widgets/list_view_builder.dart';
import '../found_lost_document_page/found_lost_document_page.dart';
import '../reusable_widgets/custom_card_widget.dart';

class All extends StatefulWidget {
  List<Widget> list;
  All({Key? key,
  required this.list}) : super(key: key);

  @override
  AllState createState() => AllState();
}



class AllState extends State<All> {


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
