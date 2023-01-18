import 'package:foods_test/app/data/models/food_model/food_model.dart';
import 'package:get/get.dart';

import '../../../core/repositories/api_repository.dart';
import '../views/food_button_view.dart';

class HomePageController extends GetxController {

  var myList = <FoodButtonView>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getFood();
  }

  void _getFood() async {
    List<FoodModel>? foodModelList = await ApiRepository().getFoods();
    print('Response: ${foodModelList?.length}');

    var foodButtonViewList = <FoodButtonView>[];

    for (FoodModel foodModel in foodModelList ?? []) {
      foodButtonViewList.add(FoodButtonView(foodModel: foodModel));
    }
    myList.addAll(foodButtonViewList);
  }
}
