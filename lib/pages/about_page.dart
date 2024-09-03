import 'package:flutter/material.dart';
import '../localization/localization_constants.dart';
import '../routes/routes_name.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'about_us')),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              getTranslated(context, 'about_us'),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              getTranslated(context, 'local_dummy_text'),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              getTranslated(context, 'mission_statement'),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              getTranslated(context, 'values'),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Center(
              child: MaterialButton(
                color: Colors.green,
                child: Text(
                  getTranslated(context, 'navigate_to_settings'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, settingsRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

