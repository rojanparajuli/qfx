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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'SIGN IN /SIGN UP',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'CUSTOMER SERVICE',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                // const Divider(),
                // ListTile(
                //   leading: TextButton(
                //     style: TextButton.styleFrom(
                //       textStyle: const TextStyle(fontSize: 18),
                //     ),
                //     onPressed: () {
                //       // Get.to(const TermsAndConditionsScreen());
                //     },
                //     child: const Text(
                //       'CUSTOMER SERVICE',
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18),
                //     ),
                //   ),
                // ),
                // ListTile(
                //   leading: TextButton(
                //     style: TextButton.styleFrom(
                //       textStyle: const TextStyle(fontSize: 18),
                //     ),
                //     onPressed: () {
                //       // Get.to(const TermsAndConditionsScreen());
                //     },
                //     child: const Text(
                //       'CUSTOMER SERVICE',
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18),
                //     ),
                //   ),
                // ),
                const Divider(),

                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'CLUB QFX',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Divider(),

                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'OFFERS & PROMOTIONS',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Divider(),

                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'ADVERTISE WITH US',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Divider(),

                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'BECOME QFX FRANCHISEE',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Divider(),

                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'CAREERS',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Divider(),

                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'ABOUT US',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Divider(),

                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'FAQs',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      'TERMS AND CONDITIONS',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Get.to(const TermsAndConditionsScreen());
                    },
                    child: const Text(
                      ' PRIVACY POLICY ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                // Divider(),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'Connect With US',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: CustomColors.scaffoldDarkBack,
                          shape: BoxShape.circle),
                      child: Image.asset('assets/facebook.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: CustomColors.scaffoldDarkBack,
                          shape: BoxShape.circle),
                      child: Image.asset('assets/insta.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: CustomColors.scaffoldDarkBack,
                          shape: BoxShape.circle),
                      child: Image.asset('assets/x.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: CustomColors.scaffoldDarkBack,
                          shape: BoxShape.circle),
                      child: Image.asset('assets/tiktok.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: CustomColors.scaffoldDarkBack,
                          shape: BoxShape.circle),
                      child: Image.asset('assets/whatsapp.png'),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
