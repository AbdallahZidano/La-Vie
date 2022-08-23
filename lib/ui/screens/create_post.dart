import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/create_post.dart';

import '../../helper/constants/colors.dart';
import '../widgets/button.dart';
import '../widgets/login_text_field.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final CreatePostController _controller = Get.put(CreatePostController());
  final ColorHepler _colorHepler = ColorHepler();
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
                GetBuilder<CreatePostController>(builder: (_) {
                  return InkWell(
                    onTap: () {
                      _controller.pickImage(context);
                    },
                    child: Container(
                      width: 130,
                      height: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          !_controller.imageSelected
                              ? Column(
                                  children: const [
                                    Icon(Icons.add,
                                        color: Colors.green, size: 35),
                                    SizedBox(height: 10),
                                  ],
                                )
                              : Container(),
                          _controller.imageSelected
                              ? Container(
                                  width: 127,
                                  height: 127,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          FileImage(_controller.selectedImage),
                                    ),
                                  ),
                                )
                              : const Text(
                                  "Add photo",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                  ),
                                ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.lightGreen, width: 1),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 30),
                LoginTextField(
                  controller: _titleController,
                  lable: "Title",
                  obscureText: false,
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      textAlign: TextAlign.right,
                    ),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 4,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
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
                CustomButton(
                  text: "Post",
                  isBorder: false,
                  onPreesed: () {
                    if (_titleController.text.isNotEmpty &&
                        _descriptionController.text.isNotEmpty) {
                      _controller.createPost(context, _titleController.text,
                          _descriptionController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
