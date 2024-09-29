// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerModel _$HomeBannerModelFromJson(Map<String, dynamic> json) =>
    HomeBannerModel(
      id: (json['id'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      redirectUrl: json['redirectUrl'] as String,
    );

Map<String, dynamic> _$HomeBannerModelToJson(HomeBannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'redirectUrl': instance.redirectUrl,
    };
