// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_wait_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewWaitInfo _$CrewWaitInfoFromJson(Map<String, dynamic> json) => CrewWaitInfo(
      crewMemberId: json['crewMemberId'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as String?,
      age: (json['age'] as num).toInt(),
      town: json['town'] as String,
      applyDate: json['applyDate'] as String,
      depositStatus: json['depositStatus'] as String,
    );

Map<String, dynamic> _$CrewWaitInfoToJson(CrewWaitInfo instance) =>
    <String, dynamic>{
      'crewMemberId': instance.crewMemberId,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'age': instance.age,
      'town': instance.town,
      'applyDate': instance.applyDate,
      'depositStatus': instance.depositStatus,
    };

CrewWaitListModel _$CrewWaitListModelFromJson(Map<String, dynamic> json) =>
    CrewWaitListModel(
      content: (json['content'] as List<dynamic>)
          .map((e) => CrewWaitInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$CrewWaitListModelToJson(CrewWaitListModel instance) =>
    <String, dynamic>{
      'content': instance.content.map((e) => e.toJson()).toList(),
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'hasNext': instance.hasNext,
    };
