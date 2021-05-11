import 'package:bikroy_app/Controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final LanguageController languageController = Get.put(LanguageController());

  String language = '';

  void changeToEn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Language', 'English');
    setState(() {
      language = 'English';
    });
  }

  void changeToBn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Language', 'Bangla');
    setState(() {
      language = 'Bangla';
    });
  }

  void getLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    language = preferences.getString('Language');
  }

  @override
  void initState() {
    super.initState();
    getLang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Color(0xFF009878), title: Text('set1'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  languageController.changeLanguange('bn', 'BD');
                  changeToBn();
                },
                child: Text('বাংলা'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  elevation: 0.0,
                  side: BorderSide(color: Colors.grey[300]),
                  primary: (language == 'English')
                      ? Colors.white
                      : Colors.deepOrange[800],
                  onPrimary:
                      (language == 'English') ? Colors.black54 : Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  languageController.changeLanguange('en', 'US');
                  changeToEn();
                },
                child: Text('English'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  elevation: 0.0,
                  side: BorderSide(color: Colors.grey[300]),
                  primary: (language == 'English')
                      ? Colors.deepOrange[800]
                      : Colors.white,
                  onPrimary:
                      (language == 'English') ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
