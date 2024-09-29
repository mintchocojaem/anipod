import 'package:json_annotation/json_annotation.dart';

import 'volunteer_post.dart';

part 'volunteer_board.g.dart';

@JsonSerializable()
class VolunteerBoardModel {
  final List<VolunteerPostModel> content;
  final int page;
  final int size;
  final int totalPages;
  final int totalElements;
  final bool hasNext;

  VolunteerBoardModel({
    required this.content,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.totalElements,
    required this.hasNext,
  });

  factory VolunteerBoardModel.fromJson(Map<String, dynamic> json) =>
      _$VolunteerBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$VolunteerBoardModelToJson(this);
}
