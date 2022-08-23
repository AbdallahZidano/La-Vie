import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/blogs.dart';
import 'package:test/ui/widgets/blogs_item.dart';

class BlogsScreen extends StatefulWidget {
  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  final BlogsController _controller = Get.put(BlogsController());
  @override
  void initState() {
    super.initState();
    _controller.getAllBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<BlogsController>(builder: (context) {
        return Scaffold(
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
          body: _controller.blogs == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.blogs!.plants.length,
                  itemBuilder: (context, index) {
                    return BlogsItem(
                      id: _controller.blogs!.plants[index].plantId,
                      title: _controller.blogs!.plants[index].name,
                      description: _controller.blogs!.plants[index].description,
                      imageUrl: _controller.blogs!.plants[index].imageUrl,
                      waterCapacity:
                          _controller.blogs!.plants[index].waterCapacity,
                      sunLight: _controller.blogs!.plants[index].sunLight,
                      temperature: _controller.blogs!.plants[index].temperature,
                    );
                  },
                ),
        );
      }),
    );
  }
}
