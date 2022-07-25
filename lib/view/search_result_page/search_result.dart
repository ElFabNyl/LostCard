

import 'package:flutter/material.dart';
import 'package:lostcard/view/reusable_widgets/custom_found_card_widget.dart';
import '../reusable_widgets/custom_lost_card_widget.dart';
import '../reusable_widgets/customized_search_field.dart';

class SearchResult extends StatefulWidget {
  final String searchInput;
  const SearchResult({Key? key,
  required this.searchInput}) : super(key: key);


  @override
  SearchResultState createState() => SearchResultState(searchInput: searchInput);
}

class SearchResultState extends State<SearchResult> {
  final String searchInput;

  SearchResultState({required this.searchInput});


  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Container(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: SingleChildScrollView(
                child: Column(
                  children:  [
                    CustomizedSearchField(
                      width: 350,
                      height: 52,

                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    CustomFoundCard(),



                    const SizedBox(
                      height: 20,
                    ),


                    CustomFoundCard(),

                    const SizedBox(
                      height: 20,
                    ),


                    CustomLostCard(),


                  ],
                ),
              ),
            ),
    );
    throw UnimplementedError();
  }
}
