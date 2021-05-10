import 'package:bikroy_app/Controller/language_controller.dart';
import 'package:bikroy_app/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionScreen extends StatelessWidget {
  final double _sizedBoxHeight = 10.0;

  void gotoHome() {
    saveData();
    Get.offAll(HomePage());
  }

  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('Intro_screen', true);
  }

  void changeToEn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Language', 'English');
  }

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.put(LanguageController());

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: gotoHome,
                  ),
                ),
              ),
              SizedBox(height: 150),
              Image.asset(
                'assets/images/money_bag.png',
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SizedBox(
                height: _sizedBoxHeight + 10.0,
              ),
              Text(
                'intro1'.tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(
                height: _sizedBoxHeight,
              ),
              Text(
                'intro2'.tr,
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'intro3'.tr,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: _sizedBoxHeight,
              ),
              ElevatedButton(
                child: Text('intro4'.tr),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF019877),
                  onPrimary: Colors.white,
                  elevation: 0.0,
                  padding: EdgeInsets.only(
                      top: 9.0, bottom: 9.0, left: 30.0, right: 30.0),
                  minimumSize: Size(230, 40),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: _sizedBoxHeight,
              ),
              ElevatedButton(
                child: Text('intro5'.tr),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Color(0xFF019877),
                  side: BorderSide(color: Colors.grey, width: 1),
                  minimumSize: Size(230, 40),
                  elevation: 0.0,
                  padding: EdgeInsets.only(
                      top: 9.0, bottom: 9.0, left: 30.0, right: 30.0),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                onPressed: gotoHome,
              ),
              SizedBox(
                height: _sizedBoxHeight,
              ),
              ElevatedButton(
                child: Text('English'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black45,
                  shadowColor: Colors.white,
                  side: BorderSide(color: Colors.grey[300], width: 1),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                onPressed: () {
                  changeToEn();
                  languageController.changeLanguange('en', 'US');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
