// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBoardModel _$HomeBoardModelFromJson(Map<String, dynamic> json) =>
    HomeBoardModel(
      banners: (json['banners'] as List<dynamic>?)
              ?.map((e) => HomeBannerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      volunteers: (json['volunteers'] as List<dynamic>)
          .map(
              (e) => HomeVolunteerPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      posts: (json['posts'] as List<dynamic>)
          .map(
              (e) => HomeCommunityPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crews: (json['crews'] as List<dynamic>)
          .map((e) => HomeCrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeBoardModelToJson(HomeBoardModel instance) =>
    <String, dynamic>{
      'banners': instance.banners.map((e) => e.toJson()).toList(),
      'volunteers': instance.volunteers.map((e) => e.toJson()).toList(),
      'posts': instance.posts.map((e) => e.toJson()).toList(),
      'crews': instance.crews.map((e) => e.toJson()).toList(),
    };
