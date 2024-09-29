// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCrewModel _$HomeCrewModelFromJson(Map<String, dynamic> json) =>
    HomeCrewModel(
      crewId: json['crewId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      neighborhood: json['neighborhood'] as String,
      memberCount: (json['memberCount'] as num).toInt(),
    );

Map<String, dynamic> _$HomeCrewModelToJson(HomeCrewModel instance) =>
    <String, dynamic>{
      'crewId': instance.crewId,
      'name': instance.name,
      'description': instance.description,
      'neighborhood': instance.neighborhood,
      'memberCount': instance.memberCount,
    };
