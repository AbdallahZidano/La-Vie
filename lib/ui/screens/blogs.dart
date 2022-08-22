import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/blogs.dart';
import 'package:test/ui/widgets/blogs_item.dart';

class BlogsScreen extends StatelessWidget {
  final BlogsController _controller = Get.put(BlogsController());

  @override
  Widget build(BuildContext context) {
    _controller.getAllBlogs();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Blogs",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: _controller.blogs!.plants.length,
          itemBuilder: (context, index) {
            return BlogsItem(
              title: _controller.blogs!.plants[index].name,
              description: _controller.blogs!.plants[index].description,
              imageUrl: _controller.blogs!.plants[index].imageUrl,
              waterCapacity: _controller.blogs!.plants[index].waterCapacity,
              sunLight: _controller.blogs!.plants[index].sunLight,
              temperature: _controller.blogs!.plants[index].temperature,
            );
          },
        ),
      ),
    );
  }
}
