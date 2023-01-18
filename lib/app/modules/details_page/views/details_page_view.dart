import 'package:flutter/material.dart';
import 'package:foods_test/app/aspect/constants/string_const.dart';
import 'package:foods_test/app/core/helpers/text_style_helper.dart';
import 'package:foods_test/app/core/helpers/ui_helper.dart';

import 'package:get/get.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../../aspect/constants/color_const.dart';
import '../controllers/details_page_controller.dart';

class DetailsPageView extends GetView<DetailsPageController> {
  const DetailsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
            icon: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorConst.blue,
                size: 25,
              ),
            )),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          color: ColorConst.white,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              _buildTitle(),
              _buildChart(),
              _buildSubTitle(),
              UiHelper.h2(),
              _buildTile(title: 'Calories', value: '242 kcal'),
              _buildTile(color: ColorConst.blue, title: StringConst.protein, value: '12 g'),
              _buildTile(color: ColorConst.orange, title: StringConst.fat, value: '17.4 g'),
              _buildTile(color: ColorConst.purple, title: StringConst.totalCarbs, value: '3g g'),
              _buildTile(title: 'Sugar', value: '8 g', valueColor: ColorConst.grey2),
              _buildTile(title: 'Glycemic Load', value: '14 g', valueColor: ColorConst.grey2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Mozzarella cheese mini',
        style: TextStyleHelper.overpass(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildChart() {

    List<ChartLayer> layers() {
      return [
        ChartGroupPieLayer(
          items: [
            [
              ChartGroupPieDataItem(
                  amount: 4, color: ColorConst.blue, label: ''),
              ChartGroupPieDataItem(
                  amount: 4, color: ColorConst.orange, label: ''),
              ChartGroupPieDataItem(
                  amount: 1, color: ColorConst.purple, label: '')
            ],
          ],
          settings: const ChartGroupPieSettings(thickness: 9),
        ),
      ];
    }

    double contSize = 190;

    return Center(
      child: SizedBox(
        height: contSize,
        width: contSize,
        child: Stack(
          children: [
            SizedBox(
                height: contSize,
                width: contSize,
                child: Chart(layers: layers())),
            SizedBox(
              height: contSize,
              width: contSize,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '242',
                      style: TextStyleHelper.overpass(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UiHelper.h1(),
                    Text(
                      'kcal',
                      style: TextStyleHelper.overpass(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Nutrition facts',
        style: TextStyleHelper.overpass(
            fontSize: 23,
        ),
      ),
    );
  }

  Widget _buildTile({
    Color? color,
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          if (color != null) _buildColorDot(color: color),
          _buildText(text: title),
          const Spacer(),
          _buildText(text: value, color: valueColor),
        ],
      ),
    );
  }
  
  Text _buildText({required String text, Color? color}) {
    return Text(
        text,
      style: TextStyleHelper.overpass(
        fontSize: 20,
        color: color ?? ColorConst.black,
      ),
    );
  }

  Container _buildColorDot({required Color color}) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  
}
