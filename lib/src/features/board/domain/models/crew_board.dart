import 'package:json_annotation/json_annotation.dart';

import 'crew.dart';

part 'crew_board.g.dart';

@JsonSerializable()
class CrewBoardModel {
  final List<CrewModel> content;
  final int page;
  final int size;
  final int totalPages;
  final int totalElements;
  final bool hasNext;

  CrewBoardModel({
    required this.content,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.totalElements,
    required this.hasNext,
  });

  factory CrewBoardModel.fromJson(Map<String, dynamic> json) =>
      _$CrewBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewBoardModelToJson(this);
}
