import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';

class RecentItem extends StatelessWidget {
  final ColorHepler _colorHepler = ColorHepler();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.access_time_outlined,
            color: _colorHepler.lightGrey,
            size: 23,
          ),
          const SizedBox(width: 15),
          Text(
            "Zidano",
            style: TextStyle(
              color: _colorHepler.lightGrey,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: _colorHepler.lightGrey,
              size: 23,
            ),
          ),
        ],
      ),
    );
  }
}
