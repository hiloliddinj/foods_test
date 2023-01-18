import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.freezed.dart';
part 'food_model.g.dart';

@Freezed()
class FoodModel extends Equatable with _$FoodModel {
  const FoodModel._();

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

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);

  @override
  List<Object?> get props =>
      [clr, prtn, ft, tcrb, sgr, gl, clrj, ncrb, als, src, sgm, gr, nm, mmt];
}

@Freezed()
class MmtModel extends Equatable with _$MmtModel {
  const MmtModel._();

  const factory MmtModel({
    required String? u,
    required double? q,
    required double? s,
    required double? g,
    required bool? df,
  }) = _MmtModel;

  factory MmtModel.fromJson(Map<String, dynamic> json) =>
      _$MmtModelFromJson(json);

  @override
  List<Object?> get props => [u, q, s, g, df];
}
