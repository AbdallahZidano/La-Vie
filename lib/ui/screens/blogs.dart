import 'package:flutter/material.dart';
import 'package:test/ui/widgets/blogs_item.dart';

class BlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Blogs",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return BlogsItem();
          },
        ),
      ),
    );
  }
}
