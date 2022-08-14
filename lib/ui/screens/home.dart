import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/constants/colors.dart';
import '../../helper/constants/image_paths.dart';
import '../widgets/home_card.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                    width: size.width / 1.39,
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
            SizedBox(
              width: double.infinity,
              height: size.height / 1.46,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeCard(width: size.width),
                      const SizedBox(width: 20),
                      HomeCard(width: size.width),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
