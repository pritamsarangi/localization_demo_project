import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_intl_demo_proj/routes/routes_name.dart';

import '../pages/about_page.dart';
import '../pages/home_page.dart';
import '../pages/not_found_page.dart';
import '../pages/settings_page.dart';

class CustomRouter{
  static Route<dynamic> allRoutes(RouteSettings settings){
    switch(settings.name){
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
        case settingsRoute:
      return MaterialPageRoute(builder: (_) => SettingsPage());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}