import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/auth/login.dart';
import 'package:test/helper/constants/colors.dart';

import '../../helper/constants/image_paths.dart';
import 'button.dart';
import 'login_text_field.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final ImagePaths _imagePaths = ImagePaths();

  final ColorHepler _colorHepler = ColorHepler();

  final LoginController _controller = Get.put(LoginController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: LoginTextField(
            controller: _emailController,
            lable: 'Email',
            obscureText: false,
            inputType: TextInputType.emailAddress,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: LoginTextField(
            controller: _passwordController,
            lable: 'Password',
            obscureText: true,
            inputType: TextInputType.visiblePassword,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: CustomButton(
            text: "Login",
            isBorder: false,
            onPreesed: () {
              if (_passwordController.text != '' &&
                  _emailController.text != '') {
                if (_emailController.text.isEmail) {
                  FocusManager.instance.primaryFocus?.unfocus();

                  _controller.loginWithApi(
                    context,
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
                    content: Text("Please Entr your data"),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
