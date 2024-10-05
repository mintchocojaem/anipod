import 'package:json_annotation/json_annotation.dart';

part 'crew_wait_list.g.dart';

@JsonSerializable()
class CrewWaitInfo {
  final String crewMemberId;
  final String nickname;
  final String? gender;
  final int age;
  final String town;
  final String applyDate;
  final String depositStatus;

  CrewWaitInfo({
    required this.crewMemberId,
    required this.nickname,
    this.gender,
    required this.age,
    required this.town,
    required this.applyDate,
    required this.depositStatus,
  });

  factory CrewWaitInfo.fromJson(Map<String, dynamic> json) =>
      _$CrewWaitInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CrewWaitInfoToJson(this);
}

@JsonSerializable()
class CrewWaitListModel {
  final List<CrewWaitInfo> content;
  final int totalPages;
  final int totalElements;
  final bool hasNext;

  CrewWaitListModel({
    required this.content,
    required this.totalPages,
    required this.totalElements,
    required this.hasNext,
  });

  factory CrewWaitListModel.fromJson(Map<String, dynamic> json) =>
      _$CrewWaitListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewWaitListModelToJson(this);
}
