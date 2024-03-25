import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:qfx/screen/homescreen.dart';
import 'package:qfx/screen/splash/splash_screen.dart';


void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false
      ),
      home: const SplashScreen(),
    );
  }
}