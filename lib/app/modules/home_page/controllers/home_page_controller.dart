import 'package:foods_test/app/core/helpers/storage_helper.dart';
import 'package:foods_test/app/data/models/food_model/food_model.dart';
import 'package:get/get.dart';

import '../../../core/repositories/api_repository.dart';
import '../views/food_button_view.dart';

class HomePageController extends GetxController {

  RxList<FoodButtonView> allFoodButtonViewList = <FoodButtonView>[].obs;
  RxList<FoodButtonView> favoriteFoodButtonViewList = <FoodButtonView>[].obs;

  List<FoodModel> allFoodModelList = <FoodModel>[];
  List<FoodModel> favoriteFoodModelList = <FoodModel>[];

  RxBool isHome = true.obs;

  @override
  void onInit() {
    super.onInit();
    _getFavoriteFoods();
    _getFood();
  }

  Future<void> _getFood() async {
    List<FoodModel>? foodModelList = await ApiRepository().getFoods();

    if (foodModelList != null) {
      allFoodModelList = foodModelList.toList();
    }

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

  Future<void> _getFavoriteFoods() async {
    List<FoodModel> favorites = await StorageHelper.getFavoriteFoodModelsList();

    favoriteFoodModelList = favorites.toList();

    var favoriteFoodButtonViewList = <FoodButtonView>[];

    for (FoodModel foodModel in favoriteFoodModelList) {
      favoriteFoodButtonViewList.add(FoodButtonView(foodModel: foodModel, isFavorite: true));
    }
    this.favoriteFoodButtonViewList.value = favoriteFoodButtonViewList.toList();
  }

  void updateIsHome({required bool isHome}) {
    this.isHome.value = isHome;
  }

  void updateHomePage({required bool isFavorite, required FoodModel foodModel}) {

    for(int i=0; i< allFoodModelList.length; i++) {
      if (allFoodModelList[i] == foodModel) {
        allFoodButtonViewList.removeAt(i);
        allFoodButtonViewList.insert(i, FoodButtonView(foodModel: foodModel, isFavorite: isFavorite));
        break;
      }
    }

    if (isFavorite) {
      favoriteFoodModelList.add(foodModel);
      favoriteFoodButtonViewList.add(FoodButtonView(foodModel: foodModel, isFavorite: isFavorite));
    } else {
      for(int i=0; i< favoriteFoodModelList.length; i++) {
        if (favoriteFoodModelList[i] == foodModel) {
          favoriteFoodModelList.removeAt(i);
          favoriteFoodButtonViewList.removeAt(i);
          break;
        }
      }
    }
  }

}
