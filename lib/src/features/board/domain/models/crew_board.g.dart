// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewBoardModel _$CrewBoardModelFromJson(Map<String, dynamic> json) =>
    CrewBoardModel(
      content: (json['content'] as List<dynamic>)
          .map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$CrewBoardModelToJson(CrewBoardModel instance) =>
    <String, dynamic>{
      'content': instance.content.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'size': instance.size,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'hasNext': instance.hasNext,
    };
