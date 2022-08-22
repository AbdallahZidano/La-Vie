import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';
import '../ui/widgets/dialog_indicator.dart';

class CreatePostController extends GetxController {
  File selectedImage = File('');
  bool imageSelected = false;

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

  createPost(String title, String description) {
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
          "imageBase64": imageBase64
        },
        headers: {"Authorization": "Bearer $accessToken"},
      ).then((value) async {
        print(value);
        // ForumsModel data = ForumsModel.fromJson(value);
        // forums = data.data;
        // update();
        Get.back();
      }).catchError((e) {
        if (e is DioError) {
          print(e.response);
          Get.back();
        }
        // print(e);
      });
    }
  }
}
