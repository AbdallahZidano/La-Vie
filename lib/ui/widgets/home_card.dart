import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/home.dart';

import '../../helper/constants/colors.dart';
import '../../helper/constants/image_paths.dart';

class HomeCard extends StatelessWidget {
  int index;
  String name;
  String price;
  String imageUrl;
  int quantity;
  HomeCard({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.index,
    required this.quantity,
  });

  final ImagePaths _imagePaths = ImagePaths();
  final ColorHepler _colorHepler = ColorHepler();
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width / 2.4,
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
            alignment: const AlignmentDirectional(-0.9, -1.2),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-0.2, 0.35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  price + " EGP",
                  style: const TextStyle(
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
                  child: InkWell(
                    onTap: () {
                      _controller.productDecreaseQuantity(index);
                    },
                    child: Icon(
                      Icons.remove,
                      size: 12,
                      color: _colorHepler.text,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                GetBuilder<HomeController>(builder: (context) {
                  return Text(
                    quantity.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                }),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: InkWell(
                    onTap: () {
                      _controller.productIncreaseQuantity(index);
                    },
                    child: Icon(
                      Icons.add,
                      size: 12,
                      color: _colorHepler.text,
                    ),
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
