import 'package:flutter/material.dart';

class DropDownDocumentType extends StatefulWidget {
  void Function(String?)? onChanged;
  String dropDownValue;

  DropDownDocumentType({
    required this.onChanged,
    required this.dropDownValue,
    Key? key,
  }) : super(key: key);

  @override
  DropDownDocumentTypeState createState() => DropDownDocumentTypeState();
}

class DropDownDocumentTypeState extends State<DropDownDocumentType> {
  var items = [
    'Select Document type',
    'CNI',
    'Passport',
    'CreditCard',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59,
      width: 343,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                  )),
        ),
        value: widget.dropDownValue,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
