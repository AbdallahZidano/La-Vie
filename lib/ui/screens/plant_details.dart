import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';
import 'package:test/ui/screens/blogs.dart';
import 'package:test/ui/widgets/button.dart';

import '../widgets/details_item.dart';

class PlantDetailsScreen extends StatelessWidget {
  final ImagePaths _imagePaths = ImagePaths();
  final ColorHepler _colorHepler = ColorHepler();
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
                  image: AssetImage(_imagePaths.plant_5),
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
                  const Text(
                    'SNAKE PLANT (SANSEVIERIA)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Native to southern Africa, snake plants are well adapted to conditions similar to those in southern regions of the United States. Because of this, they may be grown outdoors for part of all of the year in USDA zones 8 and warmer",
                    style: TextStyle(color: _colorHepler.text),
                    softWrap: true,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Common Snake Plant Diseases",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "A widespread problem with snake plants is root rot. This results from over-watering the soil of the plant and is most common in the colder months of the year. When room rot occurs, the plant roots can die due to a lack of oxygen and an overgrowth of fungus within the soil. If the snake plant's soil is soggy,rowth of fungus within the soil. If the snake plant's soil is soggy,rowth of fungus within the soil. If the snake plant's soil is soggy,rowth of fungus within the soil. If the snake plant's soil is soggy,rowth of fungus within the soil. If the snake plant's soil is soggy, certain microorganisms such as Rhizoctonia and Pythium can begin to populate and multiply, disease throughout th",
                    style: TextStyle(color: _colorHepler.text),
                    softWrap: true,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
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
                    title: '78%',
                    subTitle: 'Sun Light',
                  ),
                  const SizedBox(height: 20),
                  DetailsItem(
                    image: Image.asset(_imagePaths.water),
                    title: '10%',
                    subTitle: 'Water capacity',
                  ),
                  const SizedBox(height: 20),
                  DetailsItem(
                    image: Image.asset(_imagePaths.temp),
                    title: '29 ° c',
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
