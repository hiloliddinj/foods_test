import 'package:foods_test/app/core/helpers/storage_helper.dart';
import 'package:foods_test/app/data/models/food_model/food_model.dart';
import 'package:get/get.dart';

import '../../../core/repositories/api_repository.dart';
import '../views/food_button_view.dart';

class HomePageController extends GetxController {

  RxList<FoodButtonView> allFoodButtonViewList = <FoodButtonView>[].obs;
  RxList<FoodButtonView> favoriteFoodButtonViewList = <FoodButtonView>[].obs;

  List<FoodModel> allFoodModelList = <FoodModel>[];
  RxList<FoodModel> favoriteFoodModelList = <FoodModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getFavoriteFoods();
    _getFood();
  }

  Future<void> _getFood() async {
    List<FoodModel>? foodModelList = await ApiRepository().getFoods();
    print('Response: ${foodModelList?.length}');

    var foodButtonViewList = <FoodButtonView>[];

    for (FoodModel foodModel in foodModelList ?? []) {
      bool isFavorite = false;
      for (FoodModel favoriteFoodModel in favoriteFoodModelList) {
        if (favoriteFoodModel == foodModel) {
          isFavorite = true;
          break;
        }
      }
      foodButtonViewList.add(FoodButtonView(foodModel: foodModel, isFavorite: isFavorite));
    }
    allFoodButtonViewList.addAll(foodButtonViewList);
  }

  void _getFavoriteFoods() {
    List<FoodModel> favorites = StorageHelper.getFavoriteFoodModelsList();
    favoriteFoodModelList.addAll(favorites);
  }

}
