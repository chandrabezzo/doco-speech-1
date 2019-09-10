import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:doco_speech_flutter/constant/strings.dart';
export 'package:doco_speech_flutter/constant/strings.dart';

class LocalizationUtil {
  final Locale locale;

  LocalizationUtil(this.locale);

  static LocalizationUtil of(BuildContext context){
    return Localizations.of(context, LocalizationUtil);
  }
  
  static Map<String, Map<String, String>> _localizedValues = {
    'en':en,
    'id':id
  };
  
  getValue(String key) => _localizedValues[locale.languageCode][key];
}

class LocalizationUtilDelegate extends LocalizationsDelegate<LocalizationUtil> {
  const LocalizationUtilDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'id'].contains(locale.languageCode);

  @override
  Future<LocalizationUtil> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of LocalizationUtil.
    return SynchronousFuture<LocalizationUtil>(LocalizationUtil(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationUtil> old) => false; 
}