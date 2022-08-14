import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';

import 'cart.dart';
import 'home_search.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePaths _imagePaths = ImagePaths();

  final ColorHepler _colorHepler = ColorHepler();

  bool allSelected = true;

  bool mySelected = false;

  List<String> categoryList = ['All', 'Plants', 'Seeds', 'Tools'];

  List<bool> enabledList = [true, false, false, false, false];

  int length = 7;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            _imagePaths.logo,
            fit: BoxFit.cover,
            width: 100,
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.to(HomeSearchScreen());
                },
                child: Container(
                  width: width / 1.39,
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: const [
                        Icon(Icons.search_rounded, color: Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () {
                  Get.to(CartScreen());
                },
                child: Container(
                  child: Image.asset(
                    _imagePaths.cart,
                    fit: BoxFit.cover,
                    width: 20,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _colorHepler.brand,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: width / 1.165,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: const [],
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Container(
                      width: width / 2.2,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            spreadRadius: 0.1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "GARDENIA PLANT",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const Text("70 EGP"),
                            const SizedBox(height: 10),
                            Center(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  child: const Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: _colorHepler.brand,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          _imagePaths.plant1,
                          // fit: BoxFit.cover,
                          // height: 250,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 25),
            ],
          )
        ],
      ),
    );
  }
}
