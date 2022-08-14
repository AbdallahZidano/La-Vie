import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/auth/login.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';

import '../widgets/login_form.dart';
import '../widgets/login_text_button.dart';
import '../widgets/signup_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePaths _imagePaths = ImagePaths();
  final ColorHepler _colorHepler = ColorHepler();
  final LoginController _controller = Get.put(LoginController());

  bool signupSelected = false;
  bool loginSelected = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: loginSelected ? height / 5 : height / 7),
                  Image.asset(
                    _imagePaths.logo,
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                  SizedBox(height: loginSelected ? height / 14 : 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LoginTextButton(
                        text: 'Sign up',
                        isSelected: signupSelected,
                        onPreesed: () {
                          setState(() {
                            signupSelected = true;
                            loginSelected = false;
                          });
                        },
                      ),
                      LoginTextButton(
                        text: 'login',
                        isSelected: loginSelected,
                        onPreesed: () {
                          setState(() {
                            signupSelected = false;
                            loginSelected = true;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: loginSelected ? height / 14 : 20),
                  loginSelected ? LoginForm() : SignupForm(),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 35),
                      child: Stack(
                        children: [
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Center(
                            child: Container(
                              color: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                "or continue with",
                                style: TextStyle(
                                  color: _colorHepler.text,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _controller.googleSignIn(context);
                        },
                        child: Image.asset(_imagePaths.google),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _controller.feacbookSignIn(context);
                        },
                        child: Image.asset(_imagePaths.facebook),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      _imagePaths.treeLeafs,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: -45,
                    left: 0,
                    child: RotatedBox(
                      quarterTurns: 90,
                      child: Image.asset(
                        _imagePaths.treeLeafs,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
