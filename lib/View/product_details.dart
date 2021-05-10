import 'package:bikroy_app/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final List<String> imageList = [
    'https://firebasestorage.googleapis.com/v0/b/bikroy-app.appspot.com/o/download%20(1).jpg?alt=media&token=f6055af4-ec59-43fb-b27d-0435cbeb7140',
    'https://firebasestorage.googleapis.com/v0/b/bikroy-app.appspot.com/o/download.jpg?alt=media&token=1680cf4b-402e-492c-b288-77f07812c3fa',
    'https://firebasestorage.googleapis.com/v0/b/bikroy-app.appspot.com/o/images.jpg?alt=media&token=d58a8c36-49b3-4f87-8940-5d23d6c9635d',
    'https://firebasestorage.googleapis.com/v0/b/bikroy-app.appspot.com/o/p1.jpg?alt=media&token=33e9f1cb-05bd-487f-ab78-8ae43a29d45d',
    'https://firebasestorage.googleapis.com/v0/b/bikroy-app.appspot.com/o/p2.jpg?alt=media&token=422123e8-593b-4eb5-aefc-1847e5a8b55a',
  ];

  final String productDesc =
      'DS Trade International এর Online bazar এ আপনাকে স্বাগতম🌷\nআমাদের ঠিকানাঃ-\nDS Trade International🌍\nHouse# 16, Road# 07, Sector# 09\nUttara Dhaka 1230।\n🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗\nPrice: BDT.9,499,Tk\n100%Fixed Price\nSpecification👉\n🌷★Brand:    👉Oppo🥀\n🌷★Model:    👉A3s\n🌷★Rom:       👉64GB\n🌷★Ram:       👉04GB\n🌷★Display:  👉6.20inc\n🌷★Dual Camera\n🌷★Back Camera: 👉13MP+2MP\n🌷★Front Camera:👉 08MP\n🌷★Processor:\nQualcomm\nSnapdragon\n450\n🌷★Dual Sim\n🌷★Android 8.1\n🌷★Battery: 4230mAh\n🌷★Finger 👍\n🌷★100% Original\n🌷★কপি অথবা ক্লোন না আপনি যেইভাবে ইচ্ছা চেক করে নিতে পারবেন।\n📲মোবাইল কেনার পূর্বে আমাদের দেওয়া সার্ভিস সম্পর্কে অবগত হওয়াটা খুব জরুরি।তাই সম্পূর্ণ বিবরণটি বিস্তারিত পড়ুন।\nদামি এন্ড্রয়েট ফোন কম বাজেটের মধ্যে চাইলে আপনাকে আমরা এই মোবাইলটি সাজেস্ট করব।\nআমরা চায়না,ইন্ডিয়া কিংবা বাহিরের যেকোনো দেশ থেকে এই প্রোডাক্টগুলো নিয়ে আসি।পুরনো মডেল হওয়ার কারণে এসব মোবাইলের দাম এমনিতেই কম পরে,তাই আপনি চাইলে নিঃসঙ্কোচে এই মোবাইলগুলো ক্রয় করতে পারেন।\nএছাড়া আমরা প্রোডাক্টগুলোর সাথে ৭ দিনের রিপ্লেসমেন্ট সার্ভিস দিচ্ছি,যাতে করে আপনি কোন সমস্যায় পরলে পরিবর্তন করে নিতে পারেন।\nএবং ২ বছরের সার্ভিস ওয়ারেন্টি পার্টস ব্যাতিত।\nএছাড়াও আপনার মধ্যে যদি কোন কনফিউশন থাকে তাহলে সরাসরি আমাদের অফিসে এসে মোবাইলগুলো দেখে চেক করে নিতে পারেন।\nআমরা ঢাকার মধ্যে হোম ডেলিভারি দেইনা।\nঢাকার বাহিরে কুরিয়ারের মাধ্যমে ২৪ ঘন্টায় পণ্য পাঠিয়ে থাকি,সেক্ষেত্রে আপনাকে কুরিয়ার চার্জ ২৫০ টাকা অগ্রিম প্রদান করতে হবে।\nঅযথা দামাদামি করবেননা,যতটুকু ডিসকাউন্ট দেওয়ার আমরা দিয়েছি।\nধন্যবাদ 🌷';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 78,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 8.0,
          iconSize: 30.0,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                  child: bottomButton('call', 'proddet1'.tr),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 8.0),
                  child: bottomButton('chat', 'proddet2'.tr),
                )),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF009878),
        title: Text('proddet3'.tr),
        actions: [
          IconButton(icon: FaIcon(FontAwesomeIcons.share), onPressed: () {}),
          IconButton(
              padding: EdgeInsets.only(right: 8.0),
              icon: FaIcon(FontAwesomeIcons.star),
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageBanner(),
            detailsInfo(),
          ],
        ),
      ),
    );
  }

  Widget bottomButton(String icon, String text) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: (icon == 'call') ? Icon(Icons.call) : Icon(Icons.chat),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF009878),
        minimumSize: Size(200, 45),
        shape: RoundedRectangleBorder(),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget imageBanner() {
    return Container(
      height: 300,
      color: Colors.grey[200],
      child: CarouselSlider.builder(
        slideBuilder: (int index) {
          return Container(
              child: Stack(
            children: [
              Positioned(
                top: 5,
                right: 5,
                child: Card(
                  color: Colors.black54,
                  child: Container(
                    height: 30,
                    width: 60,
                    child: Center(
                      child: Text(
                        (index + 1).toString() +
                            ' / ' +
                            imageList.length.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Image.network(
                  imageList[index],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ));
        },
        itemCount: imageList.length,
      ),
    );
  }

  Widget detailsInfo() {
    return Container(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'OPPO A3s 4+64 ঈদ অফার (New)',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(thickness: 1.0),
          Padding(
            padding: const EdgeInsets.only(top: 11.0, bottom: 11.0, left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '৳2400',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF009878)),
              ),
            ),
          ),
          Divider(thickness: 1.0),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  customText('proddet4'.tr),
                  customText('proddet5'.tr),
                  customText('proddet6'.tr),
                  customText('proddet7'.tr),
                  customText('proddet8'.tr),
                  customText('proddet9'.tr),
                ],
              ),
              SizedBox(width: 140.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  customText('proddet10'.tr),
                  customText('Xiaomi'),
                  customText('Mi note 10 Lite'),
                  customText('6/64 GB'),
                  customText('proddet11'.tr),
                  customText('proddet12'.tr),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('proddet12'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    productDesc.substring(0, 99) + '...',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                (productDesc.length > 100)
                    ? TextButton.icon(
                        onPressed: () {},
                        label: Text('proddet14'.tr),
                        icon: Icon(Icons.arrow_forward),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                      )
                    : null,
              ],
            ),
          ),
          Divider(thickness: 1.0),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.arrow_upward_rounded),
              label: Text('proddet15'.tr),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFffc800),
                onPrimary: Colors.black,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(),
                elevation: 0.0,
                minimumSize: Size(400, 40),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.error),
              label: Text('proddet16'.tr),
              style: TextButton.styleFrom(primary: Colors.black54),
            ),
          ),
          Divider(thickness: 1.0),
        ],
      ),
    );
  }

  Widget customText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Text(text),
    );
  }
}
