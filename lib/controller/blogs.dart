import 'package:get/get.dart';

import '../data/models/blogs.dart';
import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';

class BlogsController extends GetxController {
  Data? blogs;
  Iterable<Plants>? oneBlog;
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
      update();
    });
  }

  getOneBlog(String id) {
    var item = blogs!.plants.where((item) => item.plantId == id);
    oneBlog = item;
    print('-------------------------------');
    update();
  }
}
