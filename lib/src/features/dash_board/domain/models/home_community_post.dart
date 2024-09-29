import 'package:json_annotation/json_annotation.dart';

part 'home_community_post.g.dart';

@JsonSerializable()
class HomeCommunityPostModel {
  final String title;
  final String body;
  final List images;
  final int likes;
  final int comments;

  HomeCommunityPostModel({
    required this.title,
    required this.body,
    required this.images,
    required this.likes,
    required this.comments,
  });

  factory HomeCommunityPostModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCommunityPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCommunityPostModelToJson(this);
}
