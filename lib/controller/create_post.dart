import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/helper/constants/colors.dart';

import '../data/models/create_post.dart';
import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';
import '../ui/widgets/dialog_indicator.dart';

class CreatePostController extends GetxController {
  File selectedImage = File('');
  bool imageSelected = false;
  bool postCreated = false;
  final ColorHepler _colorHepler = ColorHepler();

  Future pickImage(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      selectedImage = File(image.path);
      imageSelected = true;
      update();
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick image: $e'),
        ),
      );
    }
  }

  Future createPost(
      BuildContext context, String title, String description) async {
    if (imageSelected) {
      showCustomDialog();
      print('-----------------------------------------');
      List<int> imageBytes = selectedImage.readAsBytesSync();
      String imageBase64 = base64Encode(imageBytes);

      String accessToken =
          PreferenceUtils.getString(SharedKeys.accessToken.toString());
      DioHelper.postDataWithHeaders(
        url: '/api/v1/forums',
        data: {
          "title": title,
          "description": description,
          "imageBase64": "data:image/png;base64,$imageBase64",
        },
        headers: {"Authorization": "Bearer $accessToken"},
      ).then((value) async {
        CreatePost data = CreatePost.fromJson(value);
        print(data.message);

        update();
        Get.back();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            dismissDirection: DismissDirection.up,
            backgroundColor: _colorHepler.brand,
            content: const Text(
              "The post is created successfully",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        Get.back();
      }).catchError((e) {
        if (e is DioError) {
          print(e.response);
          Get.back();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              dismissDirection: DismissDirection.up,
              content: Text(
                "Error Please try agian",
              ),
            ),
          );
        }
        // print(e);
      });
    }
  }
}
