import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/file.dart';

part 'volunteer_post_detail.g.dart';

@JsonEnum()
enum VolunteerPeopleTypeModel {
  adult('성인', 'ADULT'),
  teenager('청소년', 'TEENAGER'),
  anyone('전체', 'ANYONE');

  final String displayName;
  final String value;

  const VolunteerPeopleTypeModel(
    this.displayName,
    this.value,
  );

  factory VolunteerPeopleTypeModel.fromJson(String value) {
    switch (value) {
      case 'ADULT':
        return VolunteerPeopleTypeModel.adult;
      case 'TEENAGER':
        return VolunteerPeopleTypeModel.teenager;
      case 'ANYONE':
        return VolunteerPeopleTypeModel.anyone;
      default:
        throw ArgumentError('Unknown VolunteerPeopleTypeModel value: $value');
    }
  }
}

@JsonEnum()
enum VolunteerStatusModel {
  before('모집 전', 'BEFORE'),
  inProgress('모집 중', 'IN_PROGRESS'),
  after('모집 완료', 'AFTER');

  final String displayName;
  final String value;

  const VolunteerStatusModel(
    this.displayName,
    this.value,
  );

  factory VolunteerStatusModel.fromJson(String value) {
    switch (value) {
      case 'BEFORE':
        return VolunteerStatusModel.before;
      case 'IN_PROGRESS':
        return VolunteerStatusModel.inProgress;
      case 'AFTER':
        return VolunteerStatusModel.after;
      default:
        throw ArgumentError('Unknown VolunteerStatusModel value: $value');
    }
  }
}

@JsonSerializable()
class VolunteerPostDetailModel {
  final String title;
  final String description;
  final String volunteerDuration;
  final String recruitmentPeriod;
  final String recruitmentAgency;
  final String volunteerPlace;
  final String volunteerTime;
  final String volunteerDays;
  final int applyCount;
  final int peopleCount;
  final VolunteerPeopleTypeModel peopleType;
  final VolunteerStatusModel status;
  final List<File> images;

  VolunteerPostDetailModel({
    required this.title,
    required this.description,
    required this.volunteerDuration,
    required this.recruitmentPeriod,
    required this.recruitmentAgency,
    required this.volunteerPlace,
    required this.volunteerTime,
    required this.volunteerDays,
    required this.applyCount,
    required this.peopleCount,
    required this.peopleType,
    required this.status,
    this.images = const [],
  });

  factory VolunteerPostDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VolunteerPostDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$VolunteerPostDetailModelToJson(this);
}
