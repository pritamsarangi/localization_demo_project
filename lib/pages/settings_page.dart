import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = prefs.getBool('darkMode') ?? false;
      _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
    });
  }

  void _changeLanguage(Language language) {
    Locale temp;
    switch (language.languageCode) {
      case ENGLISH:
        temp = const Locale('en', 'US');
        break;
      case HINDI:
        temp = const Locale('hi', 'IN');
        break;
      case CHINESE:
        temp = const Locale('zh', 'CN');
        break;
      case GERMAN:
        temp = const Locale('de', 'DE');
        break;
      default:
        temp = const Locale('en', 'US');
    }
    MyApp.setLocale(context, temp);
  }

  void _toggleDarkMode(bool value) async {
    setState(() {
      _darkMode = value;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
    MyApp.setTheme(context, _darkMode ? ThemeMode.dark : ThemeMode.light);
  }

  void _toggleNotifications(bool value) async {
    setState(() {
      _notificationsEnabled = value;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('notificationsEnabled', value);

    if (_notificationsEnabled) {
      _scheduleDailyNotification();
      print("Notifications enabled");
    } else {
      _cancelNotifications();
      print("Notifications disabled");
    }
  }

  Future<void> _scheduleDailyNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'daily_notification_channel_id',
      'Daily Notifications',
      channelDescription: 'This channel is used for daily notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Daily Notification',
      'Here is your daily notification!',
      const Time(10, 0, 0), // Notification time: 10:00 AM
      platformChannelSpecifics,
    );
  }

  Future<void> _cancelNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
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
              onChanged: _toggleDarkMode,
            ),
            SwitchListTile(
              title: Text(getTranslated(context, 'enable_notifications')),
              value: _notificationsEnabled,
              onChanged: _toggleNotifications,
            ),
          ],
        ),
      ),
    );
  }
}
