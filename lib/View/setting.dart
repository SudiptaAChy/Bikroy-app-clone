import 'package:bikroy_app/Controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  final LanguageController languageController = Get.put(LanguageController());

  void changeToEn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Language', 'English');
  }

  void changeToBn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Language', 'Bangla');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Color(0xFF009878), title: Text('set1'.tr)),
      body: Row(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              languageController.changeLanguange('bn', 'BD');
              changeToBn();
            },
            child: Text('বাংলা'),
          ),
          ElevatedButton(
            onPressed: () {
              languageController.changeLanguange('en', 'US');
              changeToEn();
            },
            child: Text('English'),
          ),
        ],
      ),
    );
  }
}
