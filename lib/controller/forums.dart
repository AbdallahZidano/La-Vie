import 'package:get/get.dart';

import '../data/models/forums.dart';
import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';

class ForumsController extends GetxController {
  List<Data>? forums = [];

  String userImageLink =
      PreferenceUtils.getString(SharedKeys.userImageLink.toString());
  String userName = PreferenceUtils.getString(SharedKeys.userName.toString());

  getAllForums() {
    String accessToken =
        PreferenceUtils.getString(SharedKeys.accessToken.toString());
    DioHelper.getDataWithHeaders(
      url: '/api/v1/forums/me',
      query: {},
      headers: {"Authorization": "Bearer $accessToken"},
    ).then((value) async {
      ForumsModel data = ForumsModel.fromJson(value);
      forums = data.data;
      update();
    });
  }

  addLike() {
    String accessToken =
        PreferenceUtils.getString(SharedKeys.accessToken.toString());
    DioHelper.getDataWithHeaders(
      url: '/api/v1/forums/me',
      query: {},
      headers: {"Authorization": "Bearer $accessToken"},
    ).then((value) async {
      ForumsModel data = ForumsModel.fromJson(value);
      forums = data.data;
      update();
    });
  }
}
