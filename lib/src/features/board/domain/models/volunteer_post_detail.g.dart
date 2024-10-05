// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_post_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolunteerPostDetailModel _$VolunteerPostDetailModelFromJson(
        Map<String, dynamic> json) =>
    VolunteerPostDetailModel(
      title: json['title'] as String,
      description: json['description'] as String,
      volunteerDuration: json['volunteerDuration'] as String,
      recruitmentPeriod: json['recruitmentPeriod'] as String,
      recruitmentAgency: json['recruitmentAgency'] as String,
      volunteerPlace: json['volunteerPlace'] as String,
      volunteerTime: json['volunteerTime'] as String,
      volunteerDays: json['volunteerDays'] as String,
      applyCount: (json['applyCount'] as num).toInt(),
      peopleCount: (json['peopleCount'] as num).toInt(),
      peopleType:
          VolunteerPeopleTypeModel.fromJson(json['peopleType'] as String),
      status: VolunteerStatusModel.fromJson(json['status'] as String),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => File.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$VolunteerPostDetailModelToJson(
        VolunteerPostDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'volunteerDuration': instance.volunteerDuration,
      'recruitmentPeriod': instance.recruitmentPeriod,
      'recruitmentAgency': instance.recruitmentAgency,
      'volunteerPlace': instance.volunteerPlace,
      'volunteerTime': instance.volunteerTime,
      'volunteerDays': instance.volunteerDays,
      'applyCount': instance.applyCount,
      'peopleCount': instance.peopleCount,
      'peopleType': _$VolunteerPeopleTypeModelEnumMap[instance.peopleType]!,
      'status': _$VolunteerStatusModelEnumMap[instance.status]!,
      'images': instance.images.map((e) => e.toJson()).toList(),
    };

const _$VolunteerPeopleTypeModelEnumMap = {
  VolunteerPeopleTypeModel.adult: 'adult',
  VolunteerPeopleTypeModel.teenager: 'teenager',
  VolunteerPeopleTypeModel.anyone: 'anyone',
};

const _$VolunteerStatusModelEnumMap = {
  VolunteerStatusModel.before: 'before',
  VolunteerStatusModel.inProgress: 'inProgress',
  VolunteerStatusModel.after: 'after',
};
