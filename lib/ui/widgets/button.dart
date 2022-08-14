import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';

class CustomButton extends StatelessWidget {
  String text;
  bool isBorder;
  CustomButton({required this.text, required this.isBorder});
  final ColorHepler _colorHepler = ColorHepler();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isBorder ? _colorHepler.brand : Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isBorder ? Colors.white : _colorHepler.brand,
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: isBorder
              ? BorderSide(color: _colorHepler.brand, width: 2)
              : BorderSide.none,
        ),
        onPressed: () {},
      ),
    );
  }
}
