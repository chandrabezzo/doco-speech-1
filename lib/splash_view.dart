import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {

  static const String routeName = "/splash";

  final String message;

  SplashView(this.message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Splash"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                message, style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              )),
              SizedBox(height: 16),
              Switch.adaptive(
                value: true,
                onChanged: (value){

                },
              ),
              RaisedButton(
                child: Text("Close"),
                onPressed: (){
                  Timer(Duration(seconds:  3), (){
                    Navigator.pop(context);
                  });
                },
              )
            ]
          ),
        ),
      ),
    );
  }
}