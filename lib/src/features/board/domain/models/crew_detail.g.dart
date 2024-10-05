// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewDetailMemberModel _$CrewDetailMemberModelFromJson(
        Map<String, dynamic> json) =>
    CrewDetailMemberModel(
      nickname: json['nickname'] as String,
      profileImageUrl: json['profileImageUrl'] == null
          ? null
          : File.fromJson(json['profileImageUrl'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CrewDetailMemberModelToJson(
        CrewDetailMemberModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl?.toJson(),
    };

CrewDetailModel _$CrewDetailModelFromJson(Map<String, dynamic> json) =>
    CrewDetailModel(
      name: json['name'] as String? ?? '크루 이름',
      description: json['description'] as String,
      tag: (json['tag'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      profileImageUrl: json['profileImageUrl'] as String?,
      backgroundImageUrl: json['backgroundImageUrl'] as String?,
      imageCount: (json['imageCount'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => File.fromJson(e as Map<String, dynamic>))
          .toList(),
      memberCount: (json['memberCount'] as num).toInt(),
      members: (json['members'] as List<dynamic>)
          .map((e) => CrewDetailMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      member: json['member'] as bool,
    );

Map<String, dynamic> _$CrewDetailModelToJson(CrewDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'tag': instance.tag,
      'profileImageUrl': instance.profileImageUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'imageCount': instance.imageCount,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'memberCount': instance.memberCount,
      'members': instance.members.map((e) => e.toJson()).toList(),
      'member': instance.member,
    };
