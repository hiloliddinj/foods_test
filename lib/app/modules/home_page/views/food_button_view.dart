import 'package:flutter/material.dart';
import 'package:foods_test/app/aspect/constants/color_const.dart';
import 'package:foods_test/app/core/helpers/text_style_helper.dart';
import 'package:foods_test/app/core/helpers/ui_helper.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class FoodButtonView extends GetView {
  const FoodButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.DETAILS_PAGE);
      },
      child: SizedBox(
        height: 80,
        //width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mozzarella cheese',
                  style: TextStyleHelper.overpass(
                      fontSize: 20, color: ColorConst.black),
                ),
                UiHelper.h05(),
                Text(
                  '100g/242 Kcal; 18.1g fat',
                  style: TextStyleHelper.overpass(
                      fontSize: 18, color: ColorConst.green),
                ),
              ],
            ),
            const Icon(
              Icons.favorite,
              color: ColorConst.purple,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
