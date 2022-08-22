import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/constants/colors.dart';
import '../../helper/constants/image_paths.dart';
import '../../ui/screens/single_blog.dart';

class BlogsItem extends StatefulWidget {
  String title;
  String description;
  String imageUrl;
  int waterCapacity;
  int sunLight;
  int temperature;

  BlogsItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature,
  });

  @override
  State<BlogsItem> createState() => _BlogsItemState();
}

class _BlogsItemState extends State<BlogsItem> {
  final ImagePaths _imagePaths = ImagePaths();

  final ColorHepler _colorHepler = ColorHepler();

  int cuont = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(SingleBlogScreen());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 228, 228, 228),
              offset: Offset(2, 3),
              blurRadius: 5,
              spreadRadius: 0.1,
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Container(
              width: 120,
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) =>
                      AssetImage(_imagePaths.plants),
                  image: CachedNetworkImageProvider(
                    widget.imageUrl == ''
                        ? 'https://lavie.orangedigitalcenteregypt.com/uploads/51416d55-189c-46bc-9e34-296195d18a94.png'
                        : 'https://lavie.orangedigitalcenteregypt.com' +
                            widget.imageUrl,
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "2 days ago",
                  style: TextStyle(
                    color: _colorHepler.brand,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  width: 160,
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 150,
                  child: Text(
                    widget.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
