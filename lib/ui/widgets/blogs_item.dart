import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/constants/colors.dart';
import '../../helper/constants/image_paths.dart';
import '../../ui/screens/single_blog.dart';

class BlogsItem extends StatefulWidget {
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
                  image: AssetImage(
                    _imagePaths.plants,
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
                const Text(
                  "Cactus plant",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                const SizedBox(
                  width: 150,
                  child: Text(
                    "leaf, in botany, any usually flattened green outgrowth from the stem of",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 12),
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
