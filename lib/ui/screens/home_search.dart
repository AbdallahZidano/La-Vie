import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/search.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';

import 'recent_search_item.dart';

class HomeSearchScreen extends StatelessWidget {
  final ColorHepler _colorHepler = ColorHepler();
  final ImagePaths _imagePaths = ImagePaths();
  final SearchConteroller _conteroller = Get.put(SearchConteroller());
  bool notFound = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon:
                            Icon(Icons.filter_list, color: _colorHepler.brand),
                      ),
                    ),
                    onSubmitted: (value) {
                      _conteroller.saveSearchItem(value.toString());
                      _conteroller
                          .getSearchItems()
                          .then((value) => print(value));
                      // print(data);
                    },
                  ),
                ),
                const SizedBox(height: 30),
                !notFound
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent searchs",
                            style: TextStyle(color: _colorHepler.text),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            height: 500,
                            child: ListView.builder(
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return RecentItem();
                              },
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Results for “',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: 'Cactus plant',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: _colorHepler.brand,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: '”',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '0 found',
                                style: TextStyle(
                                    color: _colorHepler.brand, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 90),
                          Image.asset(
                            _imagePaths.frame,
                            fit: BoxFit.cover,
                            width: 230,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Not found",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
