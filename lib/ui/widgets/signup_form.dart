import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/auth/signup.dart';
import 'package:test/helper/constants/colors.dart';

import '../../helper/constants/image_paths.dart';
import 'button.dart';
import 'login_text_field.dart';

class SignupForm extends StatefulWidget {
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final ImagePaths _imagePaths = ImagePaths();

  final ColorHepler _colorHepler = ColorHepler();

  final SignUpController _controller = Get.put(SignUpController());
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                child: LoginTextField(
                  controller: _firstNameController,
                  lable: 'First Name',
                  obscureText: false,
                  inputType: TextInputType.text,
                ),
              ),
              SizedBox(width: width / 30),
              SizedBox(
                width: width / 2.6,
                child: LoginTextField(
                  controller: _lastNameController,
                  lable: 'Late Name',
                  obscureText: false,
                  inputType: TextInputType.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LoginTextField(
            controller: _emailController,
            lable: 'Email',
            obscureText: false,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          LoginTextField(
            controller: _passwordController,
            lable: 'Password',
            obscureText: true,
            inputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 10),
          LoginTextField(
            controller: _conPasswordController,
            lable: 'Confirm Password',
            obscureText: true,
            inputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 10),
          CustomButton(
            text: "Sign up",
            isBorder: false,
            onPreesed: () {
              if (_firstNameController.text != '' &&
                  _lastNameController.text != '' &&
                  _emailController.text != '' &&
                  _passwordController.text != '' &&
                  _conPasswordController.text != '') {
                if (_passwordController.text == _conPasswordController.text) {
                  if (_emailController.text.isEmail) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _controller.signupWithApi(
                      context,
                      _firstNameController.text,
                      _lastNameController.text,
                      _emailController.text,
                      _passwordController.text,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter a valid email"),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password fields do not match"),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please Entr your data"),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
