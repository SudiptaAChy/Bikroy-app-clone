import 'package:bikroy_app/Controller/connectivity_controller.dart';
import 'package:bikroy_app/View/add.dart';
import 'package:bikroy_app/View/chat.dart';
import 'package:bikroy_app/View/products.dart';
import 'package:bikroy_app/View/profile.dart';
import 'package:bikroy_app/View/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  int _currentIndex = 0;
  final _pages = [Products(), Search(), Add(), Chat(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF009878),
        unselectedItemColor: Colors.black,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: ''),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }

  Widget internetError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/error.png',
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(height: 15.0),
          Text(
            'home1'.tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            'home2'.tr,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 15.0),
          ElevatedButton(
            onPressed: retryTap,
            child: Text('home3'.tr),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF019877),
              onPrimary: Colors.white,
              padding: EdgeInsets.only(
                  top: 9.0, bottom: 9.0, left: 30.0, right: 30.0),
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  void retryTap() {
    connectivityController.getConnectionStatus();
  }
}
