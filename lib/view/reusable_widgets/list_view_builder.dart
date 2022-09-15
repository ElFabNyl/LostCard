import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/reusable_widgets/loading_indicator.dart';

class ListViewBuilder extends StatelessWidget{
  final List<Widget> allDocumentsInDatabase;
  const ListViewBuilder({
    Key? key,
    required this.allDocumentsInDatabase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    if(allDocumentsInDatabase.isNotEmpty){


      Center(child: CircularProgressIndicator(backgroundColor: CustomColor.primaryColor,));
      return Scrollbar(
        child: ListView.separated(
          //shrinkWrap:true,
          //padding: const EdgeInsets.all(8),
          itemCount: allDocumentsInDatabase.length,
          itemBuilder: (BuildContext context, int index) {
            return allDocumentsInDatabase[index];
          }, separatorBuilder: (BuildContext context, int index) { return const Divider();},

        ),
      );
      
    }
    else{

      return  Center(child: CircularProgressIndicator(color: CustomColor.primaryColor,));
      
    }
    
    
  }

}