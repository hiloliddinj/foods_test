import 'package:get/get.dart';

import '../views/food_button_view.dart';

class HomePageController extends GetxController {
  var myList = <FoodButtonView>[
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
    FoodButtonView(),
  ].obs;

  final count = 0.obs;
  @override
  void onInit() {
    print('GetxController onInit');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
