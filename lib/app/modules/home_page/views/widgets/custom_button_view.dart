import 'package:flutter/material.dart';
import 'package:foods_test/app/aspect/constants/color_const.dart';
import 'package:foods_test/app/core/helpers/text_style_helper.dart';

import 'package:get/get.dart';

class CustomButtonView extends GetView {
  const CustomButtonView({
    required this.onPressed,
    required this.title,
    required this.isActive,
    Key? key,
  }) : super(key: key);

  final void Function()? onPressed;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
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
}
