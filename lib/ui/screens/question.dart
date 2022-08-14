import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/ui/widgets/button.dart';

import '../widgets/question_card.dart';

class QuestionScreen extends StatelessWidget {
  final ColorHepler _colorHepler = ColorHepler();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Course Exam",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const Text(
                    "Question",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "1",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: _colorHepler.brand,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Text(
                      "/ 10",
                      style: TextStyle(color: _colorHepler.text, fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                "What is user experience ?",
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              QuestionCard(
                text:
                    "The user experience is how the developer feels about a user.",
                ischecked: false,
              ),
              const SizedBox(height: 25),
              QuestionCard(
                text:
                    "The user experience is how the user feels about interacting with or experiencing a product.",
                ischecked: true,
              ),
              const SizedBox(height: 25),
              QuestionCard(
                text:
                    "The user experience is the attitude the UX designer has about a product.",
                ischecked: false,
              ),
              const SizedBox(height: 70),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                      text: "Back",
                      isBorder: true,
                      onPreesed: () {},
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                      text: "Next",
                      isBorder: false,
                      onPreesed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
