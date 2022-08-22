import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/search.dart';
import 'package:test/helper/constants/colors.dart';

class RecentItem extends StatelessWidget {
  String text;
  final ColorHepler _colorHepler = ColorHepler();
  final SearchConteroller _conteroller = Get.find();

  RecentItem({required this.text});

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
            text,
            style: TextStyle(
              color: _colorHepler.lightGrey,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              _conteroller.removeRecentItem(text);
            },
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
