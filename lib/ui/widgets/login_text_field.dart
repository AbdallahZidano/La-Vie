import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';

class LoginTextField extends StatelessWidget {
  String lable;
  bool obscureText;
  TextInputType inputType;
  TextEditingController controller;

  LoginTextField({
    required this.lable,
    required this.obscureText,
    required this.inputType,
    required this.controller,
  });

  final ColorHepler _colorHepler = ColorHepler();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            lable,
            style: TextStyle(
              color: _colorHepler.text,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 40,
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              obscureText: obscureText,
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
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
