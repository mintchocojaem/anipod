// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_community_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCommunityPostModel _$HomeCommunityPostModelFromJson(
        Map<String, dynamic> json) =>
    HomeCommunityPostModel(
      title: json['title'] as String,
      body: json['body'] as String,
      images: json['images'] as List<dynamic>,
      likes: (json['likes'] as num).toInt(),
      comments: (json['comments'] as num).toInt(),
    );

Map<String, dynamic> _$HomeCommunityPostModelToJson(
        HomeCommunityPostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'images': instance.images,
      'likes': instance.likes,
      'comments': instance.comments,
    };
