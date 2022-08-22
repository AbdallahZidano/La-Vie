import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/search.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';
import 'package:test/ui/widgets/search_card.dart';

import 'recent_search_item.dart';

class HomeSearchScreen extends StatefulWidget {
  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  final ColorHepler _colorHepler = ColorHepler();

  final ImagePaths _imagePaths = ImagePaths();
  final TextEditingController _textEditingController = TextEditingController();

  final SearchConteroller _conteroller = Get.put(SearchConteroller());

  bool notFound = false;
  @override
  void initState() {
    super.initState();
    _conteroller.getRecentSearchItems();
  }

  @override
  void dispose() {
    _conteroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
                    controller: _textEditingController,
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
                    onChanged: (value) {
                      setState(() {});
                      _conteroller.search(value);
                    },
                    onSubmitted: (value) {
                      _conteroller.saveSearchItem(value.toString());
                      _conteroller.getRecentSearchItems();
                    },
                  ),
                ),
                const SizedBox(height: 30),
                _textEditingController.text.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent searchs",
                            style: TextStyle(color: _colorHepler.text),
                          ),
                          const SizedBox(height: 15),
                          GetBuilder<SearchConteroller>(builder: (context) {
                            return SizedBox(
                              width: double.infinity,
                              height: 500,
                              child: ListView.builder(
                                itemCount: _conteroller.recentItems.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      _textEditingController.text =
                                          _conteroller.recentItems[index];
                                      await _conteroller.search(
                                          _conteroller.recentItems[index]);
                                    },
                                    child: RecentItem(
                                      text: _conteroller.recentItems[index],
                                    ),
                                  );
                                },
                              ),
                            );
                          })
                        ],
                      )
                    : GetBuilder<SearchConteroller>(builder: (context) {
                        return _conteroller.toShowList.isNotEmpty
                            ? SizedBox(
                                width: double.infinity,
                                height: height / 1.2,
                                child: ListView.builder(
                                  itemCount: _conteroller.toShowList.length,
                                  itemBuilder: (context, index) {
                                    return SearchCard(
                                      item: _conteroller.toShowList[index],
                                    );
                                  },
                                ),
                              )
                            : Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: 'Results for “',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: _textEditingController.text,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: _colorHepler.brand,
                                              ),
                                            ),
                                            const TextSpan(
                                              text: '”',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '0 found',
                                        style: TextStyle(
                                            color: _colorHepler.brand),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 90),
                                  Image.asset(
                                    _imagePaths.frame,
                                    fit: BoxFit.cover,
                                    width: 200,
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    "Not found",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                      }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
