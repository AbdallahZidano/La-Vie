import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';
import '../widgets/login_text_field.dart';

class CreatePostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(flex: 1),
                    const Text(
                      "Craete New Post",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  width: 130,
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add, color: Colors.green, size: 35),
                      SizedBox(height: 10),
                      Text(
                        "Add photo",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.lightGreen, width: 1),
                  ),
                ),
                const SizedBox(height: 30),
                LoginTextField(lable: "Title"),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Description",
                      textAlign: TextAlign.right,
                    ),
                    TextField(
                      maxLines: 4,
                      style: TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(text: "Post", isBorder: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
