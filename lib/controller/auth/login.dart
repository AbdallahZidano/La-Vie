import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test/helper/dio.dart';
import 'package:test/ui/screens/main_screen.dart';

import '../../data/models/google_login.dart';
import '../../helper/utils/shared_keys.dart';
import '../../helper/utils/sharedpreferences.dart';

class LoginController extends GetxController {
  final _googleSignIn = GoogleSignIn();

  googleLogin(BuildContext context) async {
    final user = await _googleSignIn.signIn();
    final ggAuth = await user!.authentication;
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Sign in Failed")));
    } else {
      Get.defaultDialog(
        barrierDismissible: false,
        titlePadding: const EdgeInsets.only(top: 20),
        title: "Loading",
        titleStyle: const TextStyle(fontWeight: FontWeight.bold),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(width: 30),
              Text("Please Wait...")
            ],
          ),
        ),
      );
      await DioHelper.postData(
        url: '/api/v1/auth/google',
        data: {
          "id": user.id.toString(),
          "email": user.email.toString(),
          "firstName": user.displayName.toString(),
          "lastName": user.displayName.toString(),
          "picture": user.photoUrl.toString(),
        },
      ).then((value) async {
        GoogleSignInModel data = GoogleSignInModel.fromJson(value);
        await PreferenceUtils.setString(
            SharedKeys.accessToken.toString(), data.data.accessToken);
        await PreferenceUtils.setBool(SharedKeys.isLogin.toString(), true);
        Get.back();
        Get.to(MainScreen());
      }).catchError((e) {
        Get.back();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sign in Failed"),
          ),
        );
      });
    }
  }
}
