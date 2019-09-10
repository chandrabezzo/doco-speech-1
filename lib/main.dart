import 'package:doco_speech_flutter/constant/app_colors.dart';
import 'package:doco_speech_flutter/constant/session.dart';
import 'package:doco_speech_flutter/util/localization_util.dart';
import 'package:doco_speech_flutter/menu_view.dart';
import 'package:doco_speech_flutter/util/session_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(App());

class App extends StatefulWidget {

  static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates(){
    return [
      const LocalizationUtilDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ];
  }

  static Iterable<Locale> supportedLocales(){
    return [
      const Locale('id', ''),
      const Locale('en', '')
    ];
  }

  static void setLanguage(BuildContext context, Locale newLocale){
    _AppState state = context.ancestorStateOfType(TypeMatcher<_AppState>());

    state.setState((){
      SessionUtil.getAsString(LANGUAGE, "en").then((code) {
        state.locale = Locale(code, '');
      });
    });
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Locale locale = Locale('id');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doco Speech Flutter #1',
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: App.localizationsDelegates(),
      supportedLocales: App.supportedLocales(),
      theme: ThemeData(
        primaryColor: colorPrimary,
      ),
      home: MenuView(),
    );
  }
}