import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/signup.dart';
import '../../helper/dio.dart';
import '../../helper/utils/shared_keys.dart';
import '../../helper/utils/sharedpreferences.dart';
import '../../ui/screens/main_screen.dart';

class SignUpController extends GetxController {
  void signupWithApi(BuildContext context, String firstName, String lastName,
      String email, String password) {
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
      Get.to(MainScreen());
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
}
