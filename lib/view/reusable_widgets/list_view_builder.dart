import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget{
  final List<Widget> allDocumentsInDatabase;
  const ListViewBuilder({
    Key? key,
    required this.allDocumentsInDatabase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return allDocumentsInDatabase.isNotEmpty?
    ListView.separated(
      //shrinkWrap:true,
      //padding: const EdgeInsets.all(8),
      itemCount: allDocumentsInDatabase.length,
      itemBuilder: (BuildContext context, int index) {

        return allDocumentsInDatabase[index];
      }, separatorBuilder: (BuildContext context, int index) { return const Divider();},

    ):const Center(child: Text('No items'));
  }

}