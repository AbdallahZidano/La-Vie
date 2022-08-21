import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/home.dart';

import '../../helper/constants/colors.dart';
import '../../ui/widgets/empty_widget.dart';
import '../widgets/button.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ColorHepler _colorHepler = ColorHepler();

  final HomeController _controller = Get.put(HomeController());

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
              _controller.cartProducts.isEmpty
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
                        GetBuilder<HomeController>(builder: (context) {
                          return SizedBox(
                            width: double.infinity,
                            height: height / 1.45,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _controller.cartProducts.length,
                              itemBuilder: (contex, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: CartItem(
                                    index: index,
                                    name: _controller.cartProducts[index].name,
                                    price: _controller.cartProducts[index].price
                                        .toString(),
                                    imageUrl: _controller
                                        .cartProducts[index].imageUrl,
                                    quantity: _controller
                                        .cartProducts[index].quantity,
                                  ),
                                );
                              },
                            ),
                          );
                        }),
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
                            GetBuilder<HomeController>(builder: (context) {
                              return Text(
                                _controller.totalPrice.toString(),
                                style: TextStyle(
                                    color: _colorHepler.brand,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              );
                            })
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
