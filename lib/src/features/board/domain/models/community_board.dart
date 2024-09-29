import 'package:json_annotation/json_annotation.dart';

import 'community_post.dart';

part 'community_board.g.dart';

@JsonSerializable()
class CommunityBoardModel {
  final List<CommunityPostModel> content;
  final int totalPages;
  final int totalElements;
  final bool hasNext;

  CommunityBoardModel({
    required this.content,
    required this.totalPages,
    required this.totalElements,
    required this.hasNext,
  });

  factory CommunityBoardModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityBoardModelToJson(this);
}
