import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class CrewModel {
  final String crewId;
  final String name;

  CrewModel({
    required this.crewId,
    required this.name,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) =>
      _$CrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewModelToJson(this);
}
