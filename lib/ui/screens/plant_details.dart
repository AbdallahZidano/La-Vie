import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/blogs.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';
import 'package:test/ui/screens/blogs.dart';
import 'package:test/ui/widgets/button.dart';

import '../widgets/details_item.dart';

class PlantDetailsScreen extends StatelessWidget {
  final ImagePaths _imagePaths = ImagePaths();
  final ColorHepler _colorHepler = ColorHepler();
  final BlogsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: CachedNetworkImageProvider(
                    _controller.oneBlog!.first.imageUrl.isEmpty
                        ? 'https://lavie.orangedigitalcenteregypt.com/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png'
                        : 'https://lavie.orangedigitalcenteregypt.com' +
                            _controller.oneBlog!.first.imageUrl,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: height / 1.7,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _controller.oneBlog!.first.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _controller.oneBlog!.first.description,
                    style: TextStyle(color: _colorHepler.text),
                    softWrap: true,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Go To Blog",
                    isBorder: false,
                    onPreesed: () {
                      Get.to(BlogsScreen());
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsItem(
                    image: Image.asset(_imagePaths.sun),
                    title: '${_controller.oneBlog!.first.sunLight}%',
                    subTitle: 'Sun Light',
                  ),
                  const SizedBox(height: 20),
                  DetailsItem(
                    image: Image.asset(_imagePaths.water),
                    title: '${_controller.oneBlog!.first.waterCapacity}%',
                    subTitle: 'Water capacity',
                  ),
                  const SizedBox(height: 20),
                  DetailsItem(
                    image: Image.asset(_imagePaths.temp),
                    title: '${_controller.oneBlog!.first.temperature} ° c',
                    subTitle: 'Temperature',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
