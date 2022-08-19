import 'package:flutter/material.dart';

class DropDownDocumentType extends StatefulWidget {
  const DropDownDocumentType({
    Key? key,
  }) : super(key: key);

  @override
  DropDownDocumentTypeState createState() => DropDownDocumentTypeState();
}

class DropDownDocumentTypeState extends State<DropDownDocumentType> {
  String dropDownValue = 'Select Document type';
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
              borderSide: const  BorderSide(
                //color: CustomColor.primaryColor,
              )),
        ),


          value: dropDownValue,
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropDownValue = newValue!;
            });
          }),
    );
  }
}
