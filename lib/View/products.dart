import 'package:bikroy_app/Controller/banner_controller.dart';
import 'package:bikroy_app/Controller/product_list_controller.dart';
import 'package:bikroy_app/View/product_details.dart';
import 'package:bikroy_app/View/product_tile.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  final BannerController bannerController = Get.put(BannerController());
  final ProductListController productListController =
      Get.put(ProductListController());

  String getText(String text) {
    if (text.length > 50) text = text.substring(0, 46) + '...';
    return text;
  }

  Widget bannerSlide() {
    return Container(
      height: 280,
      width: double.infinity,
      child: Obx(
        () {
          if (bannerController.isLoad.value == true)
            return Container();
          else
            return CarouselSlider.builder(
              slideBuilder: (int index) {
                return Container(
                  child: Stack(
                    children: <Widget>[
                      Image(
                        image: NetworkImage(bannerController.list[index].img),
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: Container(
                          color: Colors.black26,
                          width: 430,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(bannerController.list[index].shop,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0)),
                                Text(
                                    getText(
                                        bannerController.list[index].product),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16.0)),
                                Text('৳' + bannerController.list[index].price,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF009878),
                                        fontSize: 14.0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: bannerController.list.length,
              enableAutoSlider: true,
              unlimitedMode: true,
              autoSliderDelay: Duration(seconds: 3),
              autoSliderTransitionTime: Duration(seconds: 1),
            );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009878),
        centerTitle: true,
        title: Container(
          child: Column(
            children: <Widget>[
              Text(
                'Bikroy',
                style: TextStyle(color: Colors.white),
              ),
              Obx(() {
                if (productListController.isLoad.value == true)
                  return Text('0' + ' ' + 'prod3'.tr,
                      style: TextStyle(color: Colors.white, fontSize: 12.0));
                else
                  return Text(
                      productListController.productList.length.toString() +
                          ' ' +
                          'prod3'.tr,
                      style: TextStyle(color: Colors.white, fontSize: 12.0));
              }),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.mapMarkerAlt,
                        color: Color(0xFF009878)),
                    SizedBox(width: 5.0),
                    Text('prod1'.tr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                    height: 15.0,
                    child: VerticalDivider(color: Colors.grey, thickness: 1.5)),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.tag, color: Color(0xFF009878)),
                    SizedBox(width: 5.0),
                    Text('prod2'.tr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                    height: 15.0,
                    child: VerticalDivider(color: Colors.grey, thickness: 1.5)),
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.slidersH,
                        color: Color(0xFF009878)),
                    onPressed: () {}),
              ],
            ),
            SizedBox(height: 5.0),
            bannerSlide(),
            SizedBox(height: 5.0),
            productGrid(),
          ],
        ),
      ),
    );
  }

  Widget productGrid() {
    return Container(
      color: Colors.grey[200],
      child: Obx(() {
        if (productListController.isLoad.value == true)
          return CircularProgressIndicator();
        else
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.50,
              crossAxisCount: 2,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
            ),
            itemCount: productListController.productList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: ProductTile(
                    product: productListController.productList[index]),
                onTap: () {
                  Get.to(ProductDetails());
                },
              );
            },
          );
      }),
    );
  }
}
