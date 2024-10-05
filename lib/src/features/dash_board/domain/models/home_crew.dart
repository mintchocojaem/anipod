import 'package:json_annotation/json_annotation.dart';

part 'home_crew.g.dart';

@JsonSerializable()
class HomeCrewModel {
  final String crewId;
  final String? profileImageUrl;
  final String name;
  final String description;
  final String neighborhood;
  final int memberCount;

  HomeCrewModel({
    required this.crewId,
    this.profileImageUrl,
    required this.name,
    required this.description,
    required this.neighborhood,
    required this.memberCount,
  });

  factory HomeCrewModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCrewModelToJson(this);
}
