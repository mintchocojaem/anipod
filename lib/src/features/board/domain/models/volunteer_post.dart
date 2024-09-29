import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/file.dart';

part 'volunteer_post.g.dart';

@JsonSerializable()
class VolunteerPostModel {
  final String id;
  final String shelterId;
  final String title;
  final String recruitmentAgency;
  final String volunteerPlace;
  final String createdAt;
  final List<File> images;
  final String deadline;

  VolunteerPostModel({
    required this.id,
    required this.shelterId,
    required this.title,
    required this.recruitmentAgency,
    required this.volunteerPlace,
    required this.createdAt,
    required this.images,
    required this.deadline,
  });

  factory VolunteerPostModel.fromJson(Map<String, dynamic> json) =>
      _$VolunteerPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$VolunteerPostModelToJson(this);
}
