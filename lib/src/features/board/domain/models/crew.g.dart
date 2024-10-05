// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewModel _$CrewModelFromJson(Map<String, dynamic> json) => CrewModel(
      crewId: json['crewId'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      neighborhood: json['neighborhood'] as String,
      memberCount: (json['memberCount'] as num).toInt(),
    );

Map<String, dynamic> _$CrewModelToJson(CrewModel instance) => <String, dynamic>{
      'crewId': instance.crewId,
      'profileImageUrl': instance.profileImageUrl,
      'name': instance.name,
      'description': instance.description,
      'neighborhood': instance.neighborhood,
      'memberCount': instance.memberCount,
    };
