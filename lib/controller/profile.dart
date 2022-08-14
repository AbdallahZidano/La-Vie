import 'package:get/get.dart';

import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';

class ProfileController extends GetxController {
  String userName = '';
  String userImageLink = '';
  String userPoints = '';

  void getUserInfo() {
    userName = PreferenceUtils.getString(SharedKeys.userName.toString());
    userImageLink =
        PreferenceUtils.getString(SharedKeys.userImageLink.toString());
    userPoints = PreferenceUtils.getString(SharedKeys.userPoints.toString());
    update();
  }
}
