import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';

class CategoryCrad extends StatefulWidget {
  bool isSelected;
  String text;
  CategoryCrad({
    required this.isSelected,
    required this.text,
  });

  @override
  State<CategoryCrad> createState() => _CategoryCradState();
}

class _CategoryCradState extends State<CategoryCrad> {
  final ColorHepler _colorHepler = ColorHepler();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 30,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                color: widget.isSelected
                    ? _colorHepler.brand
                    : _colorHepler.lightGrey),
          ),
        ),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Colors.white
              : const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.isSelected
                ? _colorHepler.brand
                : const Color.fromARGB(255, 240, 240, 240),
          ),
        ),
      ),
    );
  }
}
