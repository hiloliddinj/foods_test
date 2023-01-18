// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodModel _$$_FoodModelFromJson(Map<String, dynamic> json) => _$_FoodModel(
      clr: (json['clr'] as num?)?.toDouble(),
      prtn: (json['prtn'] as num?)?.toDouble(),
      ft: (json['ft'] as num?)?.toDouble(),
      tcrb: (json['tcrb'] as num?)?.toDouble(),
      sgr: (json['sgr'] as num?)?.toDouble(),
      gl: (json['gl'] as num?)?.toDouble(),
      clrj: (json['clrj'] as num?)?.toDouble(),
      ncrb: (json['ncrb'] as num?)?.toDouble(),
      als: (json['als'] as List<dynamic>?)?.map((e) => e as String).toList(),
      src: json['src'] as String?,
      sgm: json['sgm'] as String?,
      gr: json['gr'] as String?,
      nm: json['nm'] as String?,
      mmt: json['mmt'] == null
          ? null
          : MmtModel.fromJson(json['mmt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FoodModelToJson(_$_FoodModel instance) =>
    <String, dynamic>{
      'clr': instance.clr,
      'prtn': instance.prtn,
      'ft': instance.ft,
      'tcrb': instance.tcrb,
      'sgr': instance.sgr,
      'gl': instance.gl,
      'clrj': instance.clrj,
      'ncrb': instance.ncrb,
      'als': instance.als,
      'src': instance.src,
      'sgm': instance.sgm,
      'gr': instance.gr,
      'nm': instance.nm,
      'mmt': instance.mmt,
    };

_$_MmtModel _$$_MmtModelFromJson(Map<String, dynamic> json) => _$_MmtModel(
      u: json['u'] as String?,
      q: (json['q'] as num?)?.toDouble(),
      s: (json['s'] as num?)?.toDouble(),
      g: (json['g'] as num?)?.toDouble(),
      df: json['df'] as bool?,
    );

Map<String, dynamic> _$$_MmtModelToJson(_$_MmtModel instance) =>
    <String, dynamic>{
      'u': instance.u,
      'q': instance.q,
      's': instance.s,
      'g': instance.g,
      'df': instance.df,
    };
