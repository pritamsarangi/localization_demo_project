import 'package:flutter/material.dart';
import 'package:local_intl_demo_proj/localization/demo_localization.dart';
import 'package:local_intl_demo_proj/routes/custome_router.dart';
import 'package:local_intl_demo_proj/routes/routes_name.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/localization_constants.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setLocale(BuildContext context, Locale locale){
    _MyAppState?  state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;
  @override
  void initState() {
    _locale = Locale('en', 'US');
    super.initState();
  }
  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies(){
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    if(_locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        locale: _locale,
        supportedLocales: [
          Locale('en','US'),
          Locale('hi','IN'),
          Locale('zh','CN'),
          Locale('de','DE')
        ],
        localizationsDelegates: [
          DemoLocalization.Delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales){
          for(var locale in supportedLocales){
            if(locale.languageCode == deviceLocale?.languageCode &&
                locale.countryCode == deviceLocale?.countryCode){
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },

        onGenerateRoute: CustomRouter.allRoutes,
        initialRoute: homeRoute,
      );
    }
  }
}

