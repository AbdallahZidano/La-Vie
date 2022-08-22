import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/data/models/products.dart';
import 'package:test/helper/constants/colors.dart';

import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';

class HomeController extends GetxController {
  List<Data> products = [];
  List<Data> cartProducts = [];
  double totalPrice = 0;
  final ColorHepler _colorHepler = ColorHepler();

  getAllProducts() {
    String accessToken =
        PreferenceUtils.getString(SharedKeys.accessToken.toString());
    DioHelper.getDataWithHeaders(
      url: '/api/v1/products',
      query: {},
      headers: {"Authorization": "Bearer $accessToken"},
    ).then((value) async {
      ProductsModel data = ProductsModel.fromJson(value);
      products = data.data;
      update();
    });
  }

  productIncreaseQuantity(int index) {
    if (products[index].quantity >= 1 && products[index].quantity < 10) {
      products[index].quantity = products[index].quantity + 1;
      print("Product Increase Quantity Successfully");
      calculateTotalPrice();
      update();
    }
  }

  productDecreaseQuantity(int index) {
    if (products[index].quantity > 1) {
      products[index].quantity = products[index].quantity - 1;
      print("Product Decrease Quantity Successfully");
      calculateTotalPrice();
      update();
    }
  }

  void addToCart(BuildContext context, int index) {
    int productIndex = cartProducts
        .indexWhere((e) => e.productId == products[index].productId);
    if (cartProducts.isNotEmpty && productIndex != -1) {
      for (var item in cartProducts) {
        if (item.productId == cartProducts[productIndex].productId) {
          productIncreaseQuantity(index);
          update();
        }
      }
    } else {
      cartProducts.add(products[index]);
      calculateTotalPrice();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: _colorHepler.brand,
          content: const Text(
            "The product is added to cart successfully",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      update();
    }
  }

  void removeFromCart(int index) async {
    int productIndexInCart = cartProducts
        .indexWhere((e) => e.productId == products[index].productId);
    products[index].quantity = 1;
    if (cartProducts.length == 1) {
      cartProducts.clear();
    } else {
      cartProducts.removeAt(productIndexInCart);
      calculateTotalPrice();
    }
    update();
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (var product in cartProducts) {
      totalPrice = totalPrice + (product.price * product.quantity);
    }
    update();
  }
}
