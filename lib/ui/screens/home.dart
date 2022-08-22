import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/home.dart';

import '../../helper/constants/colors.dart';
import '../../helper/constants/image_paths.dart';
import '../widgets/category_card.dart';
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
  final HomeController _controller = Get.put(HomeController());

  bool allSelected = true;
  bool mySelected = false;

  List<bool> enabledList = [true, false, false, false, false];

  int length = 7;

  @override
  void initState() {
    super.initState();
    _controller.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              _imagePaths.logo,
              fit: BoxFit.cover,
              width: 100,
            ),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // حول لي لسيت فيو وابعت انديكس واعمل سي ستات هناك في الويدجت
                CategoryCrad(isSelected: true, text: 'All'),
                const SizedBox(width: 10),
                CategoryCrad(isSelected: false, text: 'Plants'),
                const SizedBox(width: 10),
                CategoryCrad(isSelected: false, text: 'Seeds'),
                const SizedBox(width: 10),
                CategoryCrad(isSelected: false, text: 'Tools'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GetBuilder<HomeController>(
            builder: (context) {
              return _controller.products.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: size.height / 1.45,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          // childAspectRatio: 3 / 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 0,
                        ),
                        itemCount: _controller.products.length,
                        itemBuilder: (context, index) {
                          return HomeCard(
                            quantity: _controller.products[index].quantity,
                            index: index,
                            imageUrl:
                                "https://lavie.orangedigitalcenteregypt.com${_controller.products[index].imageUrl}",
                            name: _controller.products[index].name,
                            price: _controller.products[index].price.toString(),
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
