import 'package:bikroy_app/Controller/connectivity_controller.dart';
import 'package:get/get.dart';

class ConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectivityController());
  }
}
