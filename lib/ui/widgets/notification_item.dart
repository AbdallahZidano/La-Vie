import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';

class NotifiactionItem extends StatelessWidget {
  String title;
  String subTitle;
  String subject;
  NotifiactionItem({
    required this.subTitle,
    required this.title,
    required this.subject,
  });

  final ImagePaths _imagePaths = ImagePaths();
  final ColorHepler _colorHepler = ColorHepler();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: AssetImage(_imagePaths.man),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width - 90,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              subject == ''
                  ? Container()
                  : Container(
                      width: width - 90,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              width: 2, color: _colorHepler.lightGrey),
                        ),
                      ),
                      child: Text(
                        subject,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
              SizedBox(height: subject == '' ? 0 : 5),
              Text(
                subTitle,
                style: TextStyle(color: _colorHepler.text, fontSize: 13),
              ),
            ],
          )
        ],
      ),
    );
  }
}
