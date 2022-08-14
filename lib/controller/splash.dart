import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test/helper/utils/shared_keys.dart';
import 'package:test/ui/screens/main_screen.dart';

import '../helper/utils/sharedpreferences.dart';
import '../ui/screens/auth.dart';

class SplashController extends GetxController {
  static final _googleSignIn = GoogleSignIn();
  void nextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isLogin = await PreferenceUtils.getBool(SharedKeys.isLogin.toString());
    if (isLogin) {
      Get.offAll(MainScreen());
    } else {
      Get.offAll(AuthScreen());
    }
  }
}
