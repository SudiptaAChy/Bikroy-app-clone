import 'package:bikroy_app/Model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  List<Product> productList = List<Product>.empty(growable: true).obs;
  var isLoad = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct() async {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    var qSnap = await instance.collection('Product').get();
    List<Product> pList = List<Product>.empty(growable: true);
    for (int i = 0; i < qSnap.docs.length; i++) {
      pList.add(Product(
          img: qSnap.docs[i]['img'],
          product: qSnap.docs[i]['product'],
          price: qSnap.docs[i]['price']));
    }
    productList = pList;
    isLoad.value = false;
  }
}
