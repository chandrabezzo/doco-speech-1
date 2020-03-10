import 'package:doco_speech_flutter/bottom_view.dart';
import 'package:doco_speech_flutter/constant/app_colors.dart';
import 'package:doco_speech_flutter/constant/session.dart';
import 'package:doco_speech_flutter/constant/text_styles.dart';
import 'package:doco_speech_flutter/dialog_view.dart';
import 'package:doco_speech_flutter/doco_icons.dart';
import 'package:doco_speech_flutter/elusive_icons.dart';
import 'package:doco_speech_flutter/main.dart';
import 'package:doco_speech_flutter/model/search_model.dart';
import 'package:doco_speech_flutter/search.dart';
import 'package:doco_speech_flutter/splash_view.dart';
import 'package:doco_speech_flutter/util/localization_util.dart';
import 'package:doco_speech_flutter/util/session_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  static const String routeName = "/menu";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(LocalizationUtil.of(context).getValue(AppTitle)),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 16),
          Center(child: Text("${LocalizationUtil.of(context).getValue(Bahasa)} :",
              style: languangeStyle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(LocalizationUtil.of(context).getValue(Indonesia)),
                color: colorPrimary,
                textColor: white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                onPressed: (){
                  SessionUtil.setAsString(LANGUAGE, "id");
                  App.setLanguage(context, Locale("id"));
                },
              ),
              SizedBox(width: 16),
              FlatButton(
                child: Text(LocalizationUtil.of(context).getValue(English)),
                color: colorAccent,
                textColor: white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                onPressed: (){
                  SessionUtil.setAsString(LANGUAGE, "en");
                  App.setLanguage(context, Locale("en"));
                },
              )
            ],
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: RaisedButton(
              color: colorPrimary,
              textColor: white,
              child: Text("Dialog"),
              onPressed: () async {
                String lang = await _currentLang(context);
                if(lang != null){
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text(lang),
                    action: SnackBarAction(
                      label: "Ganti",
                      onPressed: (){
                        if(lang == "id"){
                          SessionUtil.setAsString(LANGUAGE, "en");
                          App.setLanguage(context, Locale("en"));
                        }
                        else {
                          SessionUtil.setAsString(LANGUAGE, "id");
                          App.setLanguage(context, Locale("id"));
                        }
                      },
                    ),
                  ));
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: RaisedButton(
              child: Text("Bottom Sheet"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              onPressed: () {
                _choosedBottom(context);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: RaisedButton(
              color: colorPrimary,
              textColor: white,
              child: Text("Search"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              onPressed: () {
                _search(context);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: RaisedButton(
              color: colorPrimary,
              textColor: white,
              child: Text("Splash"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) => SplashView("pesan")
                // ));

                Navigator.pushNamed(context, SplashView.routeName, 
                  arguments: "Pesannya");
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Doco.heart),
      ),
    );
  }

  Future<String> _currentLang(BuildContext context){
    var currentLanguage = showDialog<String>(
        context: context,
        builder: (context){
          return DialogView();
        }
    );

    return currentLanguage;
  }

  void _choosedBottom(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return BottomView(_scaffoldKey);
      }
    );
  }

  void _search(BuildContext context) async {
    var values = List<SearchModel>();

    for(int counter = 0; counter < 20; counter++){
      var data = SearchModel(
          id: counter,
          value: "Data ke $counter"
      );
      values.add(data);
    }

    final result = await showSearch<SearchModel>(
        context: context,
        delegate: Search(data: values)
    );

    if(result != null){
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        content: Text(result.value),
      ));
    }
  }
}