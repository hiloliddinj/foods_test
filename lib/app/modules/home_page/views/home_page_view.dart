import 'package:flutter/material.dart';
import 'package:foods_test/app/aspect/constants/color_const.dart';
import 'package:foods_test/app/aspect/constants/string_const.dart';
import 'package:foods_test/app/core/helpers/text_style_helper.dart';
import 'package:foods_test/app/core/helpers/ui_helper.dart';

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
        _createButton(
            onPressed: () {
              controller.updateIsHome(isHome: true);
            },
            title: StringConst.home,
            isActive: isHome),
        UiHelper.w2(),
        _createButton(
            onPressed: () {
              controller.updateIsHome(isHome: false);
            },
            title: StringConst.favourites,
            isActive: !isHome),
      ],
    );
  }

  Widget _createButton({
    required void Function()? onPressed,
    required String title,
    required bool isActive,
  }) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
            backgroundColor: MaterialStateProperty.all<Color>(
                isActive ? ColorConst.green : ColorConst.grey)),
        child: SizedBox(
          width: 110,
          child: Center(
            child: Text(
              title,
              style:
                  TextStyleHelper.overpass(fontSize: 20, color: ColorConst.white),
            ),
          ),
        ),
      ),
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
