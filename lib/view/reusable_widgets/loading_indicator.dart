import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';

class LoadingIndicator{
  late BuildContext context;
  LoadingIndicator(this.context);

  Future<void> startLoading() async{
    return await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return  SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(
                  color: CustomColor.primaryColor,
                ),
              )
            ],
          );
        });

  }

  Future<void>stopLoading() async {
    Navigator.of(context).pop();
  }
}