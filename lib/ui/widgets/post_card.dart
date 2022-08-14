import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';

class PostCard extends StatelessWidget {
  final ImagePaths _imagePaths = ImagePaths();
  final ColorHepler _colorHepler = ColorHepler();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 260,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromRGBO(245, 245, 245, 1),
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(245, 245, 245, 1),
                offset: Offset(1, 1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 23,
                          foregroundImage: AssetImage(_imagePaths.man),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Abdallah Mostafa Zidan",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "1 month ago",
                              style: TextStyle(
                                fontSize: 11,
                                color: _colorHepler.text,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "how to treat plants",
                      style: TextStyle(
                        color: _colorHepler.brand,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "It is a long established gact that a reader will be distracted",
                      style: TextStyle(
                        fontSize: 11,
                        color: _colorHepler.text,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 130,
                child: Image.asset(
                  _imagePaths.plants,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset(_imagePaths.like),
            const SizedBox(width: 5),
            Text(
              "0 Likes",
              style: TextStyle(color: _colorHepler.text, fontSize: 12),
            ),
            const Spacer(flex: 1),
            Text(
              "0 Replies",
              style: TextStyle(color: _colorHepler.text, fontSize: 12),
            ),
            const Spacer(flex: 3),
          ],
        )
      ],
    );
  }
}
