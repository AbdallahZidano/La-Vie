import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/auth/login.dart';
import 'package:test/controller/profile.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';
import 'package:test/ui/widgets/button.dart';

import '../widgets/edit_profile_card.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ColorHepler _colorHepler = ColorHepler();

  final ImagePaths _imagePaths = ImagePaths();

  final LoginController _loginController = Get.put(LoginController());
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 1),
      () {
        _profileController.getUserInfo();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      body: Container(
        child: GetBuilder<ProfileController>(builder: (context) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                image: NetworkImage(_profileController.userImageLink),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.65),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      CircleAvatar(
                        foregroundImage:
                            NetworkImage(_profileController.userImageLink),
                        radius: 60,
                        backgroundColor: Colors.white.withOpacity(0),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _profileController.userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: height / 1.55,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              color: _colorHepler.second,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                Image.asset(_imagePaths.star),
                                const SizedBox(width: 20),
                                Text(
                                  "You have ${_profileController.userPoints} points",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          EditCard(text: "Change Name"),
                          const SizedBox(height: 20),
                          EditCard(text: "Change Email"),
                          const SizedBox(height: 50),
                          Center(
                            child: CustomButton(
                              isBorder: false,
                              text: "Log Out",
                              onPreesed: () {
                                _loginController.logout();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
