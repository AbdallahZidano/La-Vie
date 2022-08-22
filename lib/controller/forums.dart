import 'package:get/get.dart';

import '../data/models/forums.dart';
import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';

class ForumsController extends GetxController {
  List<Data>? forums;
  getAllForums() {
    String accessToken =
        PreferenceUtils.getString(SharedKeys.accessToken.toString());
    DioHelper.getDataWithHeaders(
      url: '/api/v1/products/blogs',
      query: {},
      headers: {"Authorization": "Bearer $accessToken"},
    ).then((value) async {
      ForumsModel data = ForumsModel.fromJson(value);
      forums = data.data;
    });
  }
}
