import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/ui/screens/question.dart';

import '../../data/models/signup.dart';
import '../../data/models/user_data.dart';
import '../../helper/dio.dart';
import '../../helper/utils/shared_keys.dart';
import '../../helper/utils/sharedpreferences.dart';
import '../../ui/widgets/dialog_indicator.dart';

class SignUpController extends GetxController {
  void signupWithApi(BuildContext context, String firstName, String lastName,
      String email, String password) {
    showCustomDialog();
    print("start send request ......");
    DioHelper.postData(
      url: '/api/v1/auth/signup',
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password
      },
    ).then((value) async {
      print("Done -----------------------------------");
      print(value);
      SignUpModel data = SignUpModel.fromJson(value);
      print("Done -----------------------------------");
      await PreferenceUtils.setString(
          SharedKeys.accessToken.toString(), data.data.accessToken);
      await PreferenceUtils.setBool(SharedKeys.isLogin.toString(), true);
      await PreferenceUtils.setString(
        SharedKeys.signinType.toString(),
        SharedKeys.signinWithApi.toString(),
      );
      saveUserInfo();
      Get.back();
      Get.to(QuestionScreen());
    }).catchError((e) {
      if (e is DioError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.response.toString()),
          ),
        );
      }
    });
  }

  saveUserInfo() {
    String accessToken =
        PreferenceUtils.getString(SharedKeys.accessToken.toString());
    DioHelper.getDataWithHeaders(
      url: '/api/v1/user/me',
      query: {},
      headers: {"Authorization": "Bearer $accessToken"},
    ).then((value) async {
      UserDataModel data = UserDataModel.fromJson(value);
      await PreferenceUtils.setString(
        SharedKeys.userName.toString(),
        "${data.data.firstName} ${data.data.lastName}",
      );
      await PreferenceUtils.setString(
        SharedKeys.userImageLink.toString(),
        data.data.imageUrl,
      );
      await PreferenceUtils.setString(
        SharedKeys.userPoints.toString(),
        data.data.userPoints,
      );
      final dateNow = DateTime.now();
      await PreferenceUtils.setString(
        SharedKeys.lastLoginDate.toString(),
        dateNow.toString(),
      );
      print("Done -----------------------------------");
    });
  }
}
