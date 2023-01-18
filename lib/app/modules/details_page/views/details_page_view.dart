import 'package:flutter/material.dart';
import 'package:foods_test/app/aspect/constants/string_const.dart';
import 'package:foods_test/app/core/helpers/storage_helper.dart';
import 'package:foods_test/app/core/helpers/text_style_helper.dart';
import 'package:foods_test/app/core/helpers/ui_helper.dart';
import 'package:foods_test/app/data/models/food_model/food_model.dart';

import 'package:get/get.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../../aspect/constants/color_const.dart';
import '../controllers/details_page_controller.dart';

class DetailsPageView extends GetView<DetailsPageController> {
  const DetailsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodModel foodModel = Get.arguments[0];
    bool isFavorite = Get.arguments[1];

    controller.updateIsFavorite(isFavorite: isFavorite);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.white,
        elevation: 0,
        leading: IconButton(
            onPressed: Get.back,
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
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                children: [
                  _buildTitle(foodModel: foodModel),
                  _buildChart(foodModel: foodModel),
                  _buildSubTitle(),
                  UiHelper.h2(),
                  _buildTile(
                      title: StringConst.calories,
                      value:
                          '${foodModel.clr?.toStringAsFixed(1)} ${StringConst.kcal}'),
                  _buildTile(
                      color: ColorConst.blue,
                      title: StringConst.protein,
                      value:
                          '${foodModel.prtn?.toStringAsFixed(1)} ${StringConst.g}'),
                  _buildTile(
                      color: ColorConst.orange,
                      title: StringConst.fat,
                      value:
                          '${foodModel.ft?.toStringAsFixed(1)} ${StringConst.g}'),
                  _buildTile(
                      color: ColorConst.purple,
                      title: StringConst.totalCarbs,
                      value:
                          '${foodModel.tcrb?.toStringAsFixed(1)} ${StringConst.g}'),
                  _buildTile(
                      title: StringConst.sugar,
                      value:
                          '${foodModel.sgr?.toStringAsFixed(1)} ${StringConst.g}',
                      valueColor: ColorConst.grey2),
                  _buildTile(
                      title: StringConst.glycemicLoad,
                      value:
                          '${foodModel.gl?.toStringAsFixed(1)} ${StringConst.g}',
                      valueColor: ColorConst.grey2),
                ],
              ),
              Obx(() => _createButton(
                    onPressed: () {
                      if (controller.isFavorite.value) {
                        StorageHelper.deleteFavorite(foodModel: foodModel);
                        controller.updateIsFavorite(isFavorite: false, foodModel: foodModel);
                        //TODO: Update Home Screen
                      } else {
                        StorageHelper.saveFavorite(foodModel: foodModel);
                        controller.updateIsFavorite(isFavorite: true, foodModel: foodModel);
                        //TODO: Update Home Screen
                      }
                    },
                    title: controller.isFavorite.value
                        ? StringConst.removeFromFavorites
                        : StringConst.saveToFavorites,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle({required FoodModel foodModel}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        foodModel.nm ?? '',
        style:
            TextStyleHelper.overpass(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildChart({required FoodModel foodModel}) {
    List<ChartLayer> layers() {
      return [
        ChartGroupPieLayer(
          items: [
            [
              ChartGroupPieDataItem(
                  amount: foodModel.prtn ?? 0,
                  color: ColorConst.blue,
                  label: ''),
              ChartGroupPieDataItem(
                  amount: foodModel.ft ?? 0,
                  color: ColorConst.orange,
                  label: ''),
              ChartGroupPieDataItem(
                  amount: foodModel.tcrb ?? 0,
                  color: ColorConst.purple,
                  label: '')
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
                      '${foodModel.clr?.toStringAsFixed(1)}',
                      style: TextStyleHelper.overpass(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UiHelper.h1(),
                    Text(
                      StringConst.kcal,
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
        StringConst.nutritionFacts,
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

  Widget _createButton({
    required void Function()? onPressed,
    required String title,
  }) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorConst.green)),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text(
                title,
                style: TextStyleHelper.overpass(
                    fontSize: 20, color: ColorConst.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
