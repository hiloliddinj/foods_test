import 'package:foods_test/app/data/models/food_model/food_model.dart';
import 'package:foods_test/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:get/get.dart';

class DetailsPageController extends GetxController {
  final HomePageController homePageController = Get.find();

  RxBool isFavorite = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }
  //
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void updateIsFavorite({required bool isFavorite, FoodModel? foodModel}) {
    this.isFavorite.value = isFavorite;

    if (foodModel != null) {
      homePageController.updateHomePage(isFavorite: isFavorite, foodModel: foodModel);
    }

  }
}
