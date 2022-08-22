import 'package:get/get.dart';
import 'package:test/helper/utils/shared_keys.dart';
import 'package:test/ui/screens/question.dart';

import '../helper/utils/sharedpreferences.dart';
import '../ui/screens/auth.dart';

class SplashController extends GetxController {
  void nextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isLogin = await PreferenceUtils.getBool(SharedKeys.isLogin.toString());
    if (isLogin) {
      bool weeklyTest = await showWeeklyTest();
      if (weeklyTest) {
        Get.offAll(QuestionScreen());
      } else {
        Get.offAll(QuestionScreen());
        // Get.offAll(MainScreen());
      }
    } else {
      Get.offAll(AuthScreen());
    }
  }

  Future<bool> showWeeklyTest() async {
    String savedDate = PreferenceUtils.getString(
      SharedKeys.lastLoginDate.toString(),
    );
    if (savedDate == null) {
      final dateNow = DateTime.now();
      await PreferenceUtils.setString(
        SharedKeys.lastLoginDate.toString(),
        dateNow.toString(),
      );
      return true;
    } else {
      final lastLoginDate = DateTime.parse(savedDate);
      final dateNow = DateTime.now();

      final difference = dateNow.difference(lastLoginDate).inDays;
      if (difference >= 7) {
        final dateNow = DateTime.now();
        await PreferenceUtils.setString(
          SharedKeys.lastLoginDate.toString(),
          dateNow.toString(),
        );
        return true;
      }
      return false;
    }
  }
}
