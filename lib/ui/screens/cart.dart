import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/constants/colors.dart';
import '../../ui/widgets/empty_widget.dart';
import '../widgets/button.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  final ColorHepler _colorHepler = ColorHepler();
  bool empty = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(flex: 1),
                  const Text(
                    "My Cart",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              empty
                  ? Column(
                      children: [
                        const SizedBox(height: 150),
                        EmptyWidget(
                          title: "Your cart is empty",
                          text:
                              "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: height / 1.45,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (contex, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: CartItem(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Totla",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "180,000 Egp",
                              style: TextStyle(
                                  color: _colorHepler.brand,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: "Checkout",
                          isBorder: false,
                          onPreesed: () {},
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
