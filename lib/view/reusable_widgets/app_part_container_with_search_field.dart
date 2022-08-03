

import 'package:flutter/material.dart';

import 'package:lostcard/view/reusable_widgets/customized_search_field.dart';



class AppPartContainerWithSearchField extends StatelessWidget{


  const AppPartContainerWithSearchField({Key? key,

  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //width: 375,
          height: 77,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomizedSearchField(
                  width: 230,
                  height: 49,

                ),


            ],

          ),



        ));

  }

}