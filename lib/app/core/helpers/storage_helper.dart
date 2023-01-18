import 'dart:convert';

import 'package:foods_test/app/aspect/constants/storage_const.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/food_model/food_model.dart';

class StorageHelper {
  static final box = GetStorage();

  static Future<List<FoodModel>> getFavoriteFoodModelsList() async {
    var data = await box.read(StorageConst.favoriteFoodsKey);
    if (data == null) {
      return <FoodModel>[];
    }
    
    var dynList = jsonDecode(data) as List;
    List<FoodModel> myList = dynList.map((i) => FoodModel.fromJson(i)).toList();

    return myList;
  }

  static Future<void> saveFavorite({required FoodModel foodModel}) async {
    List<FoodModel> favoriteFoodModelList = await getFavoriteFoodModelsList();
    favoriteFoodModelList.add(foodModel);
    await box.write(StorageConst.favoriteFoodsKey, jsonEncode(favoriteFoodModelList));
  }

  static Future<void> deleteFavorite({required FoodModel foodModel}) async {
    List<FoodModel> favoriteFoodModelList = await getFavoriteFoodModelsList();

    for (int i = 0; i< favoriteFoodModelList.length; i++) {
      if (favoriteFoodModelList[i] == foodModel) {
        favoriteFoodModelList.removeAt(i);
        break;
      }
    }
    await box.write(StorageConst.favoriteFoodsKey, jsonEncode(favoriteFoodModelList));
  }
}