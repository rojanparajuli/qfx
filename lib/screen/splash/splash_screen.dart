import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qfx/screen/homescreen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    login();
  }

  void  login () async  { 
    Timer (const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen ()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  Image.asset('assets/logo.png', scale:3 ,)               
            // Icon(
            //   Icons.food_bank,
            //   size: 80,
            //   color: Colors.black,
            // ),
            // Text(
            //   'Food APP',
            //   style: TextStyle(
            //     fontFamily: "NotoSerif-Italic",
            //     fontSize: 30,
            //     color: Colors.white, 
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
