import 'dart:convert';

import 'package:foods_test/app/aspect/constants/storage_const.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/food_model/food_model.dart';

class StorageHelper {

  static final box = GetStorage();

  static List<FoodModel> getFavoriteFoodModelsList() {
    var data = box.read(StorageConst.favoriteFoodsKey);
    if (data == null) {
      return <FoodModel>[];
    }
    List<FoodModel> favoriteFoodModelList = jsonDecode(data);
    return favoriteFoodModelList;
  }

  static void saveFavoriteFoodModelsList({required List<FoodModel> favorites}) {
    box.write(StorageConst.favoriteFoodsKey, jsonEncode(favorites));
  }
}