import 'package:flutter/material.dart';
import 'package:test/helper/constants/image_paths.dart';

class DetailsItem extends StatelessWidget {
  Image image;
  String title;
  String subTitle;
  DetailsItem({
    required this.image,
    required this.subTitle,
    required this.title,
  });

  final ImagePaths _imagePaths = ImagePaths();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: image,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subTitle,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
