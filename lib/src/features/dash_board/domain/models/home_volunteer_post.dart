import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/file.dart';

part 'home_volunteer_post.g.dart';

@JsonSerializable()
class HomeVolunteerPostModel {
  final String id;
  final String shelterId;
  final String title;
  final String recruitmentAgency;
  final String volunteerPlace;
  final String createdAt;
  final List<File> images;
  final String deadline;

  HomeVolunteerPostModel({
    required this.id,
    required this.shelterId,
    required this.title,
    required this.recruitmentAgency,
    required this.volunteerPlace,
    required this.createdAt,
    required this.images,
    required this.deadline,
  });

  factory HomeVolunteerPostModel.fromJson(Map<String, dynamic> json) =>
      _$HomeVolunteerPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeVolunteerPostModelToJson(this);
}
