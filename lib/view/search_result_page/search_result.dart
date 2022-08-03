import 'package:flutter/material.dart';
import 'package:lostcard/view/reusable_widgets/custom_card_widget.dart';

import '../reusable_widgets/customized_search_field.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({
    Key? key,
  }) : super(key: key);

  @override
  SearchResultState createState() => SearchResultState();
}

class SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomizedSearchField(
                width: 350,
                height: 52,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomCard(
                documentType:
                    '“I found it  near the total, just opposite the main road”',
                imageName: 'paul.png',
                address: 'Messassi',
                date: '10/11/21',
                ownerName: 'El Fab Nyl',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomCard(
                documentType:
                    '“I found it  near the total, just opposite the main road”',
                imageName: 'paul.png',
                address: 'Messassi',
                date: '10/11/21',
                ownerName: 'El Fab Nyl',
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
