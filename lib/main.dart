import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/helper/dio.dart';
import 'package:test/ui/screens/splash.dart';

import 'helper/utils/sharedpreferences.dart';

void main() {
  runApp(MyApp());
  DioHelper.init();
  PreferenceUtils.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Vie',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: SplashScreen(),
    );
  }
}
