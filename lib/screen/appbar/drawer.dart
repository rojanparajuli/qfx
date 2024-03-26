import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qfx/screen/appbar/Drawer_items/terms_and_conditions.dart';
// import 'package:qfx/const/colors.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: CustomColors.scaffoldDarkBack,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Get.to(const TermsAndConditionsScreen());
              },
              child: const Text('Terms and conditions'),
            ),
          )
        ],
      ),
    );
  }
}
