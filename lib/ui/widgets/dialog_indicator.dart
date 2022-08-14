import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showCustomDialog() {
  return Get.defaultDialog(
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
}
