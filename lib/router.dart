import 'package:doco_speech_flutter/menu_view.dart';
import 'package:doco_speech_flutter/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case MenuView.routeName:
        return MaterialPageRoute(builder: (_) => MenuView());
      case SplashView.routeName:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SplashView(data));
      default: 
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(
            child: Text("No route defined for ${settings.name}"),
          ))
        );
    }
  }
}