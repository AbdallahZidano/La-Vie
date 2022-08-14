import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';

class CartItem extends StatefulWidget {
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final ImagePaths _imagePaths = ImagePaths();

  final ColorHepler _colorHepler = ColorHepler();

  int cuont = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 228, 228, 228),
            offset: Offset(2, 3),
            blurRadius: 5,
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Container(
            width: 120,
            height: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  _imagePaths.woman,
                ),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Cactus plant",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "200 EGP",
                style: TextStyle(
                  color: _colorHepler.brand,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (cuont > 1) {
                                --cuont;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.remove,
                              color: _colorHepler.brand,
                              size: 15,
                            ),
                          ),
                        ),
                        Text(cuont.toString()),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (cuont < 10) {
                                ++cuont;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.add,
                              color: _colorHepler.brand,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: _colorHepler.brand,
                      size: 25,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
