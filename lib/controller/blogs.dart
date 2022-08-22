import 'package:get/get.dart';

import '../data/models/blogs.dart';
import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';

class BlogsController extends GetxController {
  Data? blogs;
  getAllBlogs() {
    String accessToken =
        PreferenceUtils.getString(SharedKeys.accessToken.toString());
    DioHelper.getDataWithHeaders(
      url: '/api/v1/products/blogs',
      query: {},
      headers: {"Authorization": "Bearer $accessToken"},
    ).then((value) async {
      BlogsModel data = BlogsModel.fromJson(value);
      blogs = data.data;
    });
  }
}
