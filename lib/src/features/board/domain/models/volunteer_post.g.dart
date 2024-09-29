// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolunteerPostModel _$VolunteerPostModelFromJson(Map<String, dynamic> json) =>
    VolunteerPostModel(
      id: json['id'] as String,
      shelterId: json['shelterId'] as String,
      title: json['title'] as String,
      recruitmentAgency: json['recruitmentAgency'] as String,
      volunteerPlace: json['volunteerPlace'] as String,
      createdAt: json['createdAt'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => File.fromJson(e as Map<String, dynamic>))
          .toList(),
      deadline: json['deadline'] as String,
    );

Map<String, dynamic> _$VolunteerPostModelToJson(VolunteerPostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shelterId': instance.shelterId,
      'title': instance.title,
      'recruitmentAgency': instance.recruitmentAgency,
      'volunteerPlace': instance.volunteerPlace,
      'createdAt': instance.createdAt,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'deadline': instance.deadline,
    };
