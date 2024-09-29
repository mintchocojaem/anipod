import 'package:json_annotation/json_annotation.dart';

part 'home_crew.g.dart';

@JsonSerializable()
class HomeCrewModel {
  final String crewId;
  final String name;
  final String description;
  final String neighborhood;
  final int memberCount;

  HomeCrewModel({
    required this.crewId,
    required this.name,
    required this.description,
    required this.neighborhood,
    required this.memberCount,
  });

  factory HomeCrewModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCrewModelToJson(this);
}
