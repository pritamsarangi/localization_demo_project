

import 'package:flutter/material.dart';
import 'package:local_intl_demo_proj/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String keys){
  final demoLocalization = DemoLocalization.of(context);
  return demoLocalization?.getTranslatedValues(keys)?? "key not found";
}
const String ENGLISH ='en';
const String HINDI ='hi';
const String CHINESE ='zh';
const String GERMAN ='de';

const String LANGUAGE_CODE ='languageCode';

Future<Locale> setLocale(String languageCode) async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}
Locale _locale(String languageCode){
  Locale _temp;
  switch(languageCode){
    case ENGLISH:
      _temp = Locale(languageCode,'US');
      break;
    case HINDI:
      _temp = Locale(languageCode,'IN');
      break;
    case CHINESE:
      _temp = Locale(languageCode,'CN');
      break;
    case GERMAN:
      _temp = Locale(languageCode,'DE');
      break;
    default:
      _temp = Locale(ENGLISH,'US');
  }
  return _temp;
}
Future<Locale> getLocale() async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}