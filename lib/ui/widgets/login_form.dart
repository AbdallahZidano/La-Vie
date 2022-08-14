import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/auth/login.dart';
import 'package:test/helper/constants/colors.dart';

import '../../helper/constants/image_paths.dart';
import 'button.dart';
import 'login_text_field.dart';

class LoginForm extends StatelessWidget {
  final ImagePaths _imagePaths = ImagePaths();
  final ColorHepler _colorHepler = ColorHepler();

  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: LoginTextField(lable: 'Email'),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: LoginTextField(lable: 'Password'),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: CustomButton(
            text: "Login",
            isBorder: false,
          ),
        ),
      ],
    );
  }
}
