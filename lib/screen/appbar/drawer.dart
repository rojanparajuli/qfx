import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qfx/const/colors.dart';
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
      // backgroundColor: CustomColors.scaffoldDarkBack,
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // IconButton(Icons.arrow_back_ios),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: CustomColors.scaffoldDarkBack, shape: BoxShape.circle),
              child: Image.asset('assets/logo.png'),
            ),
            // const CircleAvatar(
            //   backgroundImage: AssetImage('assets/logo.png', ),
            //   radius: 40,
            //   backgroundColor: CustomColors.scaffoldDarkBack,
            // ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Get.to(const TermsAndConditionsScreen());
                },
                child: const Text(
                  'Terms and conditions',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
