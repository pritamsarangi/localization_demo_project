import 'package:flutter/material.dart';
import '../localization/localization_constants.dart';
import '../classes/language.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;

  void _changeLanguage(Language language) {
    Locale temp;
    switch (language.languageCode) {
      case ENGLISH:
        temp = Locale(language.languageCode, 'US');
        break;
      case HINDI:
        temp = Locale(language.languageCode, 'IN');
        break;
      case CHINESE:
        temp = Locale(language.languageCode, 'CH');
        break;
      case GERMAN:
        temp = Locale(language.languageCode, 'DE');
        break;
      default:
        temp = Locale(language.languageCode, 'US');
    }
    MyApp.setLocale(context, temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'settings_page')),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(getTranslated(context, 'change_language')),
              trailing: DropdownButton<Language>(
                onChanged: (Language? language) {
                  if (language != null) _changeLanguage(language);
                },
                underline: const SizedBox(),
                icon: const Icon(Icons.language, color: Colors.blue),
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                  value: lang,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(lang.flag),
                      Text(lang.name),
                    ],
                  ),
                ))
                    .toList(),
              ),
            ),
            SwitchListTile(
              title: Text(getTranslated(context, 'dark_mode')),
              value: _darkMode,
              onChanged: (bool value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
            SwitchListTile(
              title: Text(getTranslated(context, 'enable_notifications')),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
