import 'package:bikroy_app/Controller/google_signin_controller.dart';
import 'package:bikroy_app/View/setting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  final GoogleSignInController googleSignInController =
      Get.put(GoogleSignInController());

  void googleTap() {
    googleSignInController.googleSignin();
  }

  void fbTap() {}

  void mailTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color(0xFF009878),
        title: Text('profile1'.tr),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.to(Settings());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() {
              if (googleSignInController.user.value == '')
                return Container(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(),
                    color: Colors.white,
                    child: loginInfo(),
                  ),
                );
              else
                return accountInfo();
            }),
            extraInfo(),
          ],
        ),
      ),
    );
  }

  Widget loginInfo() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 48.0, bottom: 8.0),
          child: Text(
            'profile2'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            'profile3'.tr,
            style: TextStyle(color: Colors.grey[600], fontSize: 16.0),
          ),
        ),
        ElevatedButton.icon(
          onPressed: googleTap,
          icon: FaIcon(FontAwesomeIcons.google),
          label: Text('profile4'.tr),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.grey[600],
            textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            padding:
                EdgeInsets.only(left: 89.0, right: 89.0, top: 5.0, bottom: 5.0),
            elevation: 0.0,
            side: BorderSide(color: Colors.grey[350], width: 1),
            shape: RoundedRectangleBorder(),
          ),
        ),
        ElevatedButton.icon(
          onPressed: fbTap,
          icon: FaIcon(FontAwesomeIcons.facebookSquare),
          label: Text('profile5'.tr),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[800],
            onPrimary: Colors.white,
            textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            padding: EdgeInsets.only(
                left: 100.0, right: 100.0, top: 5.0, bottom: 5.0),
            shape: RoundedRectangleBorder(),
            elevation: 0.0,
          ),
        ),
        ElevatedButton.icon(
          onPressed: mailTap,
          icon: FaIcon(FontAwesomeIcons.envelope),
          label: Text('profile6'.tr),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF009878),
            onPrimary: Colors.white,
            textStyle: TextStyle(fontSize: 14.0),
            padding:
                EdgeInsets.only(left: 95.0, right: 95.0, top: 5.0, bottom: 5.0),
            elevation: 0.0,
            shape: RoundedRectangleBorder(),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'By signing up for an account you agree to our',
          style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'profile7'.tr,
            style: TextStyle(color: Colors.blue, fontSize: 14.0),
          ),
        ),
      ],
    );
  }

  Widget accountInfo() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              googleSignInController.user.value,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(),
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: FaIcon(FontAwesomeIcons.tag),
                title: Text('profile8'.tr),
                onTap: () {},
              ),
              Divider(thickness: 1.0),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.store),
                title: Text('profile9'.tr),
                onTap: () {},
              ),
              Divider(thickness: 1.0),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.star),
                title: Text('profile10'.tr),
                onTap: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Card(
            shape: RoundedRectangleBorder(),
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.file),
                  title: Text('profile11'.tr),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget extraInfo() {
    return Card(
      shape: RoundedRectangleBorder(),
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: FaIcon(FontAwesomeIcons.userShield),
            title: Text('profile12'.tr),
            onTap: () {},
          ),
          Divider(thickness: 1.0),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.questionCircle),
            title: Text('profile13'.tr),
            onTap: () {},
          ),
          Divider(thickness: 1.0),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.moneyBillAlt),
            title: Text('profile14'.tr),
            onTap: () {},
          ),
          Divider(thickness: 1.0),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.ellipsisH),
            title: Text('profile15'.tr),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
