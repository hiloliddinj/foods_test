import 'package:flutter/material.dart';
import 'package:foods_test/app/aspect/constants/string_const.dart';
import 'package:foods_test/app/core/helpers/text_style_helper.dart';
import 'package:foods_test/app/core/helpers/ui_helper.dart';

import 'package:get/get.dart';
import '../../../aspect/constants/color_const.dart';
import '../controllers/splash_page_controller.dart';

class SplashPageView extends GetView<SplashPageController> {
  const SplashPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyleHelper.overpass(fontWeight: FontWeight.bold);

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(StringConst.loading, style: textStyle),
                UiHelper.h1(),
                Obx(() => Text('${controller.count}', style: textStyle)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
