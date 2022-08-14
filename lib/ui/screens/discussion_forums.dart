import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/ui/screens/create_post.dart';
import 'package:test/ui/widgets/post_card.dart';

class DiscussionScreen extends StatefulWidget {
  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  final ColorHepler _colorHepler = ColorHepler();

  bool allSelected = true;

  bool mySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          backgroundColor: _colorHepler.brand,
          onPressed: () {
            Get.to(CreatePostScreen());
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(flex: 1),
                  const Text(
                    "Discussion Forums",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // Get.to(DiscussionSearchScreen());
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
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
              const SizedBox(height: 20),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        allSelected = true;
                        mySelected = false;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 25,
                      child: Center(
                        child: Text(
                          "All Forums",
                          style: TextStyle(
                              color: allSelected
                                  ? Colors.white
                                  : _colorHepler.text),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: allSelected ? _colorHepler.brand : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: allSelected
                              ? _colorHepler.brand
                              : _colorHepler.text,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        allSelected = false;
                        mySelected = true;
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 25,
                      child: Center(
                        child: Text(
                          "My Forums",
                          style: TextStyle(
                            color:
                                mySelected ? Colors.white : _colorHepler.text,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: mySelected ? _colorHepler.brand : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: mySelected
                              ? _colorHepler.brand
                              : _colorHepler.text,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return PostCard();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
