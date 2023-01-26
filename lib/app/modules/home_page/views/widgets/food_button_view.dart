import 'package:flutter/material.dart';
import 'package:foods_test/app/aspect/constants/color_const.dart';
import 'package:foods_test/app/core/helpers/text_style_helper.dart';
import 'package:foods_test/app/core/helpers/ui_helper.dart';
import 'package:foods_test/app/data/models/food_model/food_model.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class FoodButtonView extends GetView {
  const FoodButtonView({
    required this.foodModel,
    required this.isFavorite,
    Key? key,
  }) : super(key: key);

  final FoodModel foodModel;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.DETAILS_PAGE, arguments: [foodModel, isFavorite]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        //width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    foodModel.nm ?? '',
                    maxLines: 4,
                    style: TextStyleHelper.overpass(
                        fontSize: 20, color: ColorConst.black),
                  ),
                  UiHelper.h05(),
                  Text(
                    '100g/${foodModel.clr?.toStringAsFixed(0)} Kcal; ${foodModel.ft?.toStringAsFixed(1)}g fat',
                    style: TextStyleHelper.overpass(
                        fontSize: 18, color: ColorConst.green),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: isFavorite ? const Icon(
                Icons.favorite,
                color: ColorConst.blue,
                size: 28,
              ) : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
