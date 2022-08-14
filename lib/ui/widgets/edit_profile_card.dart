import 'package:flutter/material.dart';

import '../../helper/constants/image_paths.dart';

class EditCard extends StatelessWidget {
  String text;
  final ImagePaths _imagePaths = ImagePaths();

  EditCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 1),
            blurRadius: 100,
            blurStyle: BlurStyle.inner,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        onTap: () {},
        leading: Image.asset(_imagePaths.icon),
        title: Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(
          Icons.arrow_forward,
          color: Color.fromARGB(255, 0, 109, 4),
        ),
      ),
    );
  }
}
