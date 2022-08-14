import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/splash.dart';
import 'package:test/helper/constants/image_paths.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController _controller = Get.put(SplashController());
  final ImagePaths _imagePaths = ImagePaths();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          _imagePaths.logo,
          fit: BoxFit.cover,
          width: 150,
        ),
      ),
    );
  }
}
