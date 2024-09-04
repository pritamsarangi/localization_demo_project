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
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              getTranslated(context, 'local_dummy_text'),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              getTranslated(context, 'mission_statement'),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              getTranslated(context, 'values'),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            Center(
              child: MaterialButton(
                color: Colors.green,
                child: Text(
                  getTranslated(context, 'navigate_to_settings'),
                  style: const TextStyle(color: Colors.white),
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

