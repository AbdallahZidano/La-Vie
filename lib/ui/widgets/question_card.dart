import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';

class QuestionCard extends StatelessWidget {
  final ColorHepler _colorHepler = ColorHepler();
  String text;
  bool ischecked;
  QuestionCard({required this.text, required this.ischecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: _colorHepler.brand, width: 2),
        color: const Color.fromRGBO(252, 252, 252, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Stack(
              children: [
                Icon(
                  Icons.circle_outlined,
                  size: 30,
                  color: _colorHepler.brand,
                ),
                ischecked
                    ? Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.brightness_1_rounded,
                          color: _colorHepler.brand,
                          size: 20,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
