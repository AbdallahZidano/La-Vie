import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/controller/home.dart';
import 'package:test/data/models/products.dart';
import '../helper/utils/sharedpreferences.dart';

class SearchConteroller extends GetxController {
  List<String> recentItems = [];
  final HomeController _homeController = Get.find();
  List<Data> toShowList = [];

  search(String text) {
    print(text);
    toShowList.clear();
    for (var i = 0; i < _homeController.products.length; i++) {
      if (_homeController.products[i].name.startsWith(text) ||
          _homeController.products[i].name.toLowerCase().startsWith(text) ||
          _homeController.products[i].name.toUpperCase().startsWith(text)) {
        toShowList.add(_homeController.products[i]);
      }
    }
    print(toShowList);
    update();
  }

  saveSearchItem(String value) async {
    final List<String>? items = PreferenceUtils.getStringList('searchItem');
    if (items == null) {
      await PreferenceUtils.setStringList('', <String>[value]);
    } else if (items.length >= 10) {
      items.add(value);
      items.removeAt(0);
      await PreferenceUtils.setStringList('searchItem', items);
    } else {
      items.add(value);
      await PreferenceUtils.setStringList('searchItem', items);
    }
  }

  Future getRecentSearchItems() async {
    final PreferenceUtils = await SharedPreferences.getInstance();
    recentItems = PreferenceUtils.getStringList('searchItem') ?? [];
    update();
  }

  removeRecentItem(String value) async {
    getRecentSearchItems();
    recentItems.removeWhere((item) => item == value);
    await PreferenceUtils.setStringList('searchItem', recentItems);
    getRecentSearchItems();
    update();
  }

  reomveFromListToShow(String id) {
    toShowList.removeWhere((element) => element.productId == id);
    update();
  }
}
