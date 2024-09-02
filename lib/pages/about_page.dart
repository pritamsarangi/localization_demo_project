import 'package:flutter/material.dart';

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
        title: Text('About Page'),
        centerTitle: true,
      ),
      body: Container(
        child: MaterialButton(
          color: Colors.green,
          child: Text('Navigate to settings page'),
          onPressed: (){
            Navigator.pushNamed(context, settingsRoute);
          },
        ),
      ),
    );
  }
}
