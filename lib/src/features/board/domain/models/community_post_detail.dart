import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/file.dart';

part 'community_post_detail.g.dart';

@JsonSerializable()
class CommunityCommentModel {
  final String id;
  final String author;
  final String content;
  final String createdAt;
  final List<CommunityCommentModel> replies;

  CommunityCommentModel({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
    this.replies = const [],
  });

  factory CommunityCommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityCommentModelToJson(this);
}

@JsonSerializable()
class CommunityPostDetailModel {
  final String title;
  final String author;
  final String body;
  final String createdAt;
  final List<File> images;
  final int likes;
  final bool mine;
  final bool liked;

  CommunityPostDetailModel({
    required this.title,
    required this.author,
    required this.body,
    required this.createdAt,
    required this.images,
    required this.likes,
    required this.mine,
    required this.liked,
  });

  factory CommunityPostDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityPostDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityPostDetailModelToJson(this);
}
