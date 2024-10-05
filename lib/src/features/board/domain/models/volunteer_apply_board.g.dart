// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_apply_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolunteerApplyInfoModel _$VolunteerApplyInfoModelFromJson(
        Map<String, dynamic> json) =>
    VolunteerApplyInfoModel(
      volunteerId: json['volunteerId'] as String,
      title: json['title'] as String,
      volunteerPlace: json['volunteerPlace'] as String,
      recruitmentAgency: json['recruitmentAgency'] as String,
      recruitmentPeriod: json['recruitmentPeriod'] as String,
      status: VolunteerApplyStatusModel.fromJson(json['status'] as String),
    );

Map<String, dynamic> _$VolunteerApplyInfoModelToJson(
        VolunteerApplyInfoModel instance) =>
    <String, dynamic>{
      'volunteerId': instance.volunteerId,
      'title': instance.title,
      'volunteerPlace': instance.volunteerPlace,
      'recruitmentAgency': instance.recruitmentAgency,
      'recruitmentPeriod': instance.recruitmentPeriod,
      'status': _$VolunteerApplyStatusModelEnumMap[instance.status]!,
    };

const _$VolunteerApplyStatusModelEnumMap = {
  VolunteerApplyStatusModel.waiting: 'waiting',
  VolunteerApplyStatusModel.accepted: 'accepted',
  VolunteerApplyStatusModel.rejected: 'rejected',
  VolunteerApplyStatusModel.visited: 'visited',
  VolunteerApplyStatusModel.completed: 'completed',
};

VolunteerApplyBoardModel _$VolunteerApplyBoardModelFromJson(
        Map<String, dynamic> json) =>
    VolunteerApplyBoardModel(
      content: (json['content'] as List<dynamic>)
          .map((e) =>
              VolunteerApplyInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$VolunteerApplyBoardModelToJson(
        VolunteerApplyBoardModel instance) =>
    <String, dynamic>{
      'content': instance.content.map((e) => e.toJson()).toList(),
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'hasNext': instance.hasNext,
    };
