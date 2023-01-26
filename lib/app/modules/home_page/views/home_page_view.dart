import 'package:flutter/material.dart';
import 'package:foods_test/app/aspect/constants/color_const.dart';
import 'package:foods_test/app/aspect/constants/string_const.dart';
import 'package:foods_test/app/core/helpers/ui_helper.dart';
import 'package:foods_test/app/modules/home_page/views/widgets/custom_button_view.dart';

import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double listViewHeight = MediaQuery.of(context).size.height - 210;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ColoredBox(
          color: ColorConst.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => _buildButtons(isHome: controller.isHome.value)),
                UiHelper.h1(),
                _buildFoodList(height: listViewHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildButtons({required bool isHome}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtonView(
            onPressed: () {
              controller.updateIsHome(isHome: true);
            },
            title: StringConst.home,
            isActive: isHome),
        UiHelper.w2(),
        CustomButtonView(
            onPressed: () {
              controller.updateIsHome(isHome: false);
            },
            title: StringConst.favourites,
            isActive: !isHome),
      ],
    );
  }

  Widget _buildFoodList({required double height}) {
    return SizedBox(
      height: height,
      child: Obx(() => ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.isHome.value
                ? controller.allFoodButtonViewList.length
                : controller.favoriteFoodButtonViewList.length,
            itemBuilder: (BuildContext context, int index) {
              return controller.isHome.value
                  ? controller.allFoodButtonViewList[index]
                  : controller.favoriteFoodButtonViewList[index];
            },
          )),
    );
  }
}
