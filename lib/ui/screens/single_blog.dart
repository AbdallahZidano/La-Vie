import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/blogs.dart';
import 'package:test/helper/constants/image_paths.dart';

class SingleBlogScreen extends StatelessWidget {
  final ImagePaths _imagePaths = ImagePaths();
  final BlogsController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: CachedNetworkImage(
                  imageUrl: _controller.oneBlog!.first.imageUrl.isEmpty
                      ? 'https://lavie.orangedigitalcenteregypt.com/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png'
                      : 'https://lavie.orangedigitalcenteregypt.com' +
                          _controller.oneBlog!.first.imageUrl,
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _controller.oneBlog!.first.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        _controller.oneBlog!.first.description,
                        softWrap: true,
                        style: const TextStyle(height: 2.3),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
