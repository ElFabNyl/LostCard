import 'package:flutter/material.dart';

class LoadingIndicator{
  late BuildContext context;
  LoadingIndicator(this.context);

  Future<void> startLoading() async{
    return await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return const SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
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