import 'package:flutter/material.dart';

import '../../helper/constants/colors.dart';
import '../../helper/constants/image_paths.dart';

class HomeCard extends StatelessWidget {
  final double width;
  final ImagePaths _imagePaths = ImagePaths();
  final ColorHepler _colorHepler = ColorHepler();

  HomeCard({required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width / 2.4,
      height: 250,
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(-1, 1),
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 180,
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
              child: Align(
                alignment: const AlignmentDirectional(0, 0.95),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _colorHepler.brand,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-0.8, -1),
            child: Image.asset(
              _imagePaths.plant2,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-0.2, 0.35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "GARDENIA PLANT",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "70 EGP",
                  style: TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.75, -0.2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 12,
                    color: _colorHepler.text,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  '1',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 12,
                    color: _colorHepler.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
