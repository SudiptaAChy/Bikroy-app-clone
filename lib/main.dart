import 'package:bikroy_app/Bindings/connection_binding.dart';
import 'package:bikroy_app/View/messages.dart';
import 'package:bikroy_app/View/setting.dart';
import 'package:bikroy_app/View/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String language;

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
    return GetMaterialApp(
      translations: Messages(),
      locale: (language == 'English') ? Locale('en', 'US') : Locale('bn', 'BD'),
      debugShowCheckedModeBanner: false,
      title: 'Bikroy.com',
      initialBinding: ConnectionBinding(),
      home: Settings(),
    );
  }
}
