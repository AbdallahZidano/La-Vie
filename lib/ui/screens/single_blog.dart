import 'package:flutter/material.dart';
import 'package:test/helper/constants/image_paths.dart';

class SingleBlogScreen extends StatelessWidget {
  final ImagePaths _imagePaths = ImagePaths();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.asset(
                  _imagePaths.plants,
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "5 Simple Tips to treat plants",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "leaf, in botany, any usually flattened green outgrowth from the stem of leaf, in                   botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any                 usually flattened green outgrowth from the stem of leaf, in botany, any usually flattened green outgrowth from the stem of                                  leaf, in botany, any usually flattened green outgrowth from the stem of  leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                        softWrap: true,
                        style: TextStyle(height: 2.3),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
