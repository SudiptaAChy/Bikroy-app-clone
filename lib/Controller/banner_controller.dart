import 'package:bikroy_app/Model/banner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  List<Banner> list = List<Banner>.empty(growable: true).obs;
  var isLoad = true.obs;

  @override
  void onInit() {
    super.onInit();
    getStream();
  }

  void getStream() async {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnapshot = await instance.collection('Banner Adv.').get();
    List<Banner> tList = List<Banner>.empty(growable: true);
    for (int i = 0; i < qSnapshot.docs.length; i++) {
      tList.add(Banner(
          img: qSnapshot.docs[i]['img'],
          product: qSnapshot.docs[i]['product'],
          shop: qSnapshot.docs[i]['shop'],
          price: qSnapshot.docs[i]['price']));
    }
    list = tList;
    isLoad.value = false;
  }
}
