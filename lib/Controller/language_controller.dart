import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  void changeLanguange(var language, var country) {
    Get.updateLocale(Locale(language, country));
  }
}
