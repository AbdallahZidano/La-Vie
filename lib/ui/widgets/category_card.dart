import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';

class CategoryCrad extends StatelessWidget {
  bool isSelected;
  String text;
  CategoryCrad({
    required this.isSelected,
    required this.text,
  });

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
            "All",
            style: TextStyle(
                color: isSelected ? _colorHepler.brand : _colorHepler.text),
          ),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : const Color.fromRGBO(248, 248, 248, 1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? _colorHepler.brand : _colorHepler.text,
          ),
        ),
      ),
    );
  }
}
