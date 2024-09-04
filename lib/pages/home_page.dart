import 'package:flutter/material.dart';
import 'package:local_intl_demo_proj/classes/language.dart';
import 'package:local_intl_demo_proj/main.dart';
import 'package:local_intl_demo_proj/routes/routes_name.dart';

import '../localization/localization_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _showSuccessDialog(){
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
  Future<void> _changeLanguage(Language language) async {
    Locale temp = await setLocale(language.languageCode);
   MyApp.setLocale(context, temp);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerList(),
     appBar: AppBar(
       title: Text(getTranslated(context,'home_page'),
           style: const TextStyle(
             fontWeight: FontWeight.bold
           ),
       ),
       centerTitle: true,
       backgroundColor: Colors.deepPurple[400],
       actions: [
         Padding(padding: const EdgeInsets.all(8.0),
         child: DropdownButton(
           onChanged: (Language? language) {
             if(language != null) {
               _changeLanguage(language);
             }
           },
           underline: const SizedBox(),
           icon: const Icon(Icons.language,
           color: Colors.white,
           ),
             items: Language.languageList()
             .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
             value: lang,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Text(lang.flag),
                   Text(lang.name,
                   style: const TextStyle(fontSize: 20),
                   ),
                 ],
               ),
             )).toList()
         )
         )
       ],
     ),
      body: Container(
      padding: const EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }
  Form _mainForm(BuildContext context){
    return Form(
        key: _key,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height/4,
              child: Center(
                child: Text(getTranslated(context,'personal_info'),
                textAlign:  TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TextFormField(
              validator: (val){
                if(val!.isEmpty){
                  return getTranslated(context,'required_field');
                }
                return null;
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText:getTranslated(context,'name'),
                  hintText:getTranslated(context,'name_hint'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (val){
                if(val!.isEmpty){
                  return getTranslated(context,'required_field');
                }
                return null;
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText:getTranslated(context,'email'),
                hintText: getTranslated(context,'email_hint'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: getTranslated(context,'date_of_birth')
              ),
              onTap: () async{
                FocusScope.of(context).requestFocus(FocusNode());
                await showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year),
                    lastDate: DateTime(DateTime.now().year + 20),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(onPressed:(){
              if(_key.currentState!.validate()){
                _showSuccessDialog();
              }
            },
            height: 50,
            shape: const StadiumBorder(),
            color: Colors.green,
            child: Center(
              child: Text(
                getTranslated(context,'submit_info'),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ),
          ],
        )
    );
  }
  Container _drawerList(){
    TextStyle textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              child:SizedBox(
                height: 100,
                child: CircleAvatar(),
              ),
          ),
          ListTile(
            leading: const Icon(Icons.info,
            color: Colors.white,
              size: 30,
            ),
            title: Text(getTranslated(context,'about_us'),
            style: textStyle,
            ),
            onTap: (){
              Navigator.popAndPushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(getTranslated(context,'settings'),
            style: textStyle,
            ),
            onTap: (){
              Navigator.popAndPushNamed(context, settingsRoute);
            },
          )
        ],
      ),
    );
  }
}
