import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';

class LoginTextField extends StatelessWidget {
  String lable;

  LoginTextField({required this.lable});

  final ColorHepler _colorHepler = ColorHepler();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: TextStyle(
              color: _colorHepler.text,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          const SizedBox(
            height: 40,
            child: TextField(
              style: TextStyle(fontSize: 17),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
