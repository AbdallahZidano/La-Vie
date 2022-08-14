import 'package:flutter/material.dart';
import 'package:test/helper/constants/image_paths.dart';

class EmptyWidget extends StatelessWidget {
  String title;
  String text;
  EmptyWidget({required this.text, required this.title});
  final ImagePaths _imagePaths = ImagePaths();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(_imagePaths.empty),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
