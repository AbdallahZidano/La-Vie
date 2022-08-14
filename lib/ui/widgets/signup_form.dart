import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';

import '../../helper/constants/image_paths.dart';
import 'button.dart';
import 'login_text_field.dart';

class SignupForm extends StatelessWidget {
  final ImagePaths _imagePaths = ImagePaths();
  final ColorHepler _colorHepler = ColorHepler();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: width / 2.6,
                child: LoginTextField(lable: 'First Name'),
              ),
              SizedBox(width: width / 30),
              SizedBox(
                width: width / 2.6,
                child: LoginTextField(lable: 'Late Name'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LoginTextField(lable: 'Email'),
          const SizedBox(height: 10),
          LoginTextField(lable: 'Password'),
          const SizedBox(height: 10),
          LoginTextField(lable: 'Confirm Password'),
          const SizedBox(height: 10),
          CustomButton(
            text: "Sign up",
            isBorder: false,
            onPreesed: () {},
          ),
        ],
      ),
    );
  }
}
