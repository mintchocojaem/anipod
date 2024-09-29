// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityBoardModel _$CommunityBoardModelFromJson(Map<String, dynamic> json) =>
    CommunityBoardModel(
      content: (json['content'] as List<dynamic>)
          .map((e) => CommunityPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$CommunityBoardModelToJson(
        CommunityBoardModel instance) =>
    <String, dynamic>{
      'content': instance.content.map((e) => e.toJson()).toList(),
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'hasNext': instance.hasNext,
    };
