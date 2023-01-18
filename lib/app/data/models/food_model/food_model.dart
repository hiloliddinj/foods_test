import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.freezed.dart';
part 'food_model.g.dart';

@Freezed()
class FoodModel with _$FoodModel {
  const factory FoodModel({
    required double? clr,
    required double? prtn,
    required double? ft,
    required double? tcrb,
    required double? sgr,
    required double? gl,
    required double? clrj,
    required double? ncrb,
    required List<String>? als,
    required String? src,
    required String? sgm,
    required String? gr,
    required String? nm,
    required MmtModel? mmt,
}) = _FoodModel;

  factory FoodModel.fromJson(Map<String, dynamic> json) => _$FoodModelFromJson(json);

}

@Freezed()
class MmtModel with _$MmtModel {
  const factory MmtModel({
    required String? u,
    required double? q,
    required double? s,
    required double? g,
    required bool? df,
  }) = _MmtModel;

  factory MmtModel.fromJson(Map<String, dynamic> json) => _$MmtModelFromJson(json);

}