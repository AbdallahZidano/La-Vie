import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/utils/sharedpreferences.dart';

class SearchConteroller extends GetxController {
  List<String> items = [];

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

  Future getSearchItems() async {
    final PreferenceUtils = await SharedPreferences.getInstance();
    items = PreferenceUtils.getStringList('searchItem') ?? [];
    update();
  }

  remoneItem(String value) async {
    getSearchItems();
    items.removeWhere((item) => item == value);
    await PreferenceUtils.setStringList('searchItem', items);
    getSearchItems();
    update();
  }
}
