import 'package:json_annotation/json_annotation.dart';

part 'volunteer_apply_board.g.dart';

@JsonEnum()
enum VolunteerApplyStatusModel {
  waiting('접수', 'WAITING'),
  accepted('승인', 'ACCEPTED'),
  rejected('거절', 'REJECTED'),
  visited('방문', 'VISITED'),
  completed('완료', 'COMPLETED');

  final String displayName;
  final String value;

  const VolunteerApplyStatusModel(
    this.displayName,
    this.value,
  );

  factory VolunteerApplyStatusModel.fromJson(String value) {
    return VolunteerApplyStatusModel.values.firstWhere(
      (e) => e.value == value,
    );
  }
}

@JsonSerializable()
class VolunteerApplyInfoModel {
  final String volunteerId;
  final String title;
  final String volunteerPlace;
  final String recruitmentAgency;
  final String recruitmentPeriod;
  final VolunteerApplyStatusModel status;

  VolunteerApplyInfoModel({
    required this.volunteerId,
    required this.title,
    required this.volunteerPlace,
    required this.recruitmentAgency,
    required this.recruitmentPeriod,
    required this.status,
  });

  factory VolunteerApplyInfoModel.fromJson(Map<String, dynamic> json) =>
      _$VolunteerApplyInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VolunteerApplyInfoModelToJson(this);
}

@JsonSerializable()
class VolunteerApplyBoardModel {
  final List<VolunteerApplyInfoModel> content;
  final int totalPages;
  final int totalElements;
  final bool hasNext;

  VolunteerApplyBoardModel({
    required this.content,
    required this.totalPages,
    required this.totalElements,
    required this.hasNext,
  });

  factory VolunteerApplyBoardModel.fromJson(Map<String, dynamic> json) =>
      _$VolunteerApplyBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$VolunteerApplyBoardModelToJson(this);
}
