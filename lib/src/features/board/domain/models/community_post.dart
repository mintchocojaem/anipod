import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/file.dart';

part 'community_post.g.dart';

@JsonSerializable()
class CommunityPostModel {
  final String id;
  final String title;
  final String author;
  final String body;
  final String createdAt;
  final List<File> images;
  final int likes;
  final int comments;

  CommunityPostModel({
    required this.id,
    required this.title,
    required this.author,
    required this.body,
    required this.createdAt,
    required this.images,
    required this.likes,
    required this.comments,
  });

  factory CommunityPostModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityPostModelToJson(this);
}
