// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_post_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityCommentModel _$CommunityCommentModelFromJson(
        Map<String, dynamic> json) =>
    CommunityCommentModel(
      id: json['id'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      replies: (json['replies'] as List<dynamic>?)
              ?.map((e) =>
                  CommunityCommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CommunityCommentModelToJson(
        CommunityCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'replies': instance.replies.map((e) => e.toJson()).toList(),
    };

CommunityPostDetailModel _$CommunityPostDetailModelFromJson(
        Map<String, dynamic> json) =>
    CommunityPostDetailModel(
      title: json['title'] as String,
      author: json['author'] as String,
      body: json['body'] as String,
      createdAt: json['createdAt'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => File.fromJson(e as Map<String, dynamic>))
          .toList(),
      likes: (json['likes'] as num).toInt(),
      mine: json['mine'] as bool,
      liked: json['liked'] as bool,
    );

Map<String, dynamic> _$CommunityPostDetailModelToJson(
        CommunityPostDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'body': instance.body,
      'createdAt': instance.createdAt,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'likes': instance.likes,
      'mine': instance.mine,
      'liked': instance.liked,
    };
