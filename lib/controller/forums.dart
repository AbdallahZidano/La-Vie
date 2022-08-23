import 'package:get/get.dart';

import '../data/models/all_formus.dart';
import '../data/models/forums.dart';
import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';

class ForumsController extends GetxController {
  List? myForums = [];
  List? allForums = [];

  String userImageLink =
      PreferenceUtils.getString(SharedKeys.userImageLink.toString());
  String userName = PreferenceUtils.getString(SharedKeys.userName.toString());

  getMyForums() {
    String accessToken =
        PreferenceUtils.getString(SharedKeys.accessToken.toString());
    DioHelper.getDataWithHeaders(
      url: '/api/v1/forums/me',
      query: {},
      headers: {"Authorization": "Bearer $accessToken"},
    ).then((value) async {
      ForumsModel data = ForumsModel.fromJson(value);
      myForums = data.data;
      update();
    });
  }

  getAllForums() {
    String accessToken =
        PreferenceUtils.getString(SharedKeys.accessToken.toString());
    DioHelper.getDataWithHeaders(
      url: '/api/v1/forums',
      query: {},
      headers: {"Authorization": "Bearer $accessToken"},
    ).then((value) async {
      AllForumsModel data = AllForumsModel.fromJson(value);
      allForums = data.data;
      update();
    });
  }
}
