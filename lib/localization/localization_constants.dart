

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
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}
Locale _locale(String languageCode){
  Locale temp;
  switch(languageCode){
    case ENGLISH:
      temp = Locale(languageCode,'US');
      break;
    case HINDI:
      temp = Locale(languageCode,'IN');
      break;
    case CHINESE:
      temp = Locale(languageCode,'CN');
      break;
    case GERMAN:
      temp = Locale(languageCode,'DE');
      break;
    default:
      temp = const Locale(ENGLISH,'US');
  }
  return temp;
}
Future<Locale> getLocale() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}