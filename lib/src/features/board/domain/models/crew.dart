import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class CrewModel {
  final String crewId;
  final String? profileImageUrl;
  final String name;
  final String description;
  final String neighborhood;
  final int memberCount;

  CrewModel({
    required this.crewId,
    this.profileImageUrl,
    required this.name,
    required this.description,
    required this.neighborhood,
    required this.memberCount,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) =>
      _$CrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewModelToJson(this);
}
