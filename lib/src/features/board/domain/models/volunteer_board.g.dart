// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolunteerBoardModel _$VolunteerBoardModelFromJson(Map<String, dynamic> json) =>
    VolunteerBoardModel(
      content: (json['content'] as List<dynamic>)
          .map((e) => VolunteerPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$VolunteerBoardModelToJson(
        VolunteerBoardModel instance) =>
    <String, dynamic>{
      'content': instance.content.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'hasNext': instance.hasNext,
    };
