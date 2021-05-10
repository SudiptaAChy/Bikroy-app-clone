import 'dart:async';

import 'package:bikroy_app/View/home_page.dart';
import 'package:bikroy_app/View/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void callbackHandling() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    if (_preferences.getBool('Intro_screen')) {
      Get.offAll(HomePage());
    } else {
      Get.offAll(IntroductionScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.getBool('Intro_screen') == true) {
        Get.offAll(HomePage());
      } else {
        Get.offAll(IntroductionScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF009878),
        body: Center(
          child: Image.asset(
            'assets/images/welcome.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ),
      ),
    );
  }
}
