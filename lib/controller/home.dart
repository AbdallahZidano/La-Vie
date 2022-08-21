import 'package:get/get.dart';
import 'package:test/data/models/products.dart';

import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';

class HomeController extends GetxController {
  List<Data> products = [];
  List<Data> cartProducts = [];
  double totalPrice = 0;

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
      print("---------------------------------");
      print(data.data[0].quantity);
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

  void addToCart(int index) {
    int productIndex = cartProducts
        .indexWhere((e) => e.productId == products[index].productId);
    print("----------------------------------");
    print(productIndex);
    if (cartProducts.isNotEmpty && productIndex != -1) {
      for (var item in cartProducts) {
        if (item.productId == cartProducts[productIndex].productId) {
          products[index].quantity = products[index].quantity + 1;
          calculateTotalPrice();
          print("the product added to cart successfully");
          update();
        }
      }
    } else {
      cartProducts.add(products[index]);
      calculateTotalPrice();
      print("the product added to cart successfully");
      update();
    }
  }

  void removeFromCart(int index) {
    products[index].quantity = 1;
    String productName = products[index].name;
    int productIndex = cartProducts.indexWhere((e) => e.name == productName);
    cartProducts.removeAt(productIndex);
    calculateTotalPrice();
    print("the product removed from cart successfully");
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
