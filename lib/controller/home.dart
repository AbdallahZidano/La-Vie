import 'package:get/get.dart';
import 'package:test/data/models/products.dart';

import '../helper/dio.dart';
import '../helper/utils/shared_keys.dart';
import '../helper/utils/sharedpreferences.dart';

class HomeController extends GetxController {
  List<Data> products = [];
  List<Data> cartProducts = [];

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
    if (products[index].quantity >= 0 && products[index].quantity < 10) {
      products[index].quantity = products[index].quantity + 1;
      print("Product Increase Quantity Successfully");
      update();
    }
  }

  productDecreaseQuantity(int index) {
    if (products[index].quantity >= 0) {
      products[index].quantity = products[index].quantity - 1;
      print("Product Decrease Quantity Successfully");
      update();
    }
  }

  void addToCart(int index) {
    cartProducts.add(products[index]);
    update();
  }

  void removeFromCart(int index) {
    String productName = products[index].name;
    int productIndex = cartProducts.indexWhere((e) => e.name == productName);
    cartProducts.removeAt(productIndex);
    update();
  }
}
