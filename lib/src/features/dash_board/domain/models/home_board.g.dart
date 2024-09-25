// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerModel _$HomeBannerModelFromJson(Map<String, dynamic> json) =>
    HomeBannerModel(
      id: (json['id'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      redirectUrl: json['redirectUrl'] as String,
    );

Map<String, dynamic> _$HomeBannerModelToJson(HomeBannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'redirectUrl': instance.redirectUrl,
    };

HomeVolunteerPostModel _$HomeVolunteerPostModelFromJson(
        Map<String, dynamic> json) =>
    HomeVolunteerPostModel(
      title: json['title'] as String,
      organizationName: json['organizationName'] as String,
      region: json['region'] as String,
      registrationDate: json['registrationDate'] as String,
      imageUrl: json['imageUrl'] as String,
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$HomeVolunteerPostModelToJson(
        HomeVolunteerPostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'organizationName': instance.organizationName,
      'region': instance.region,
      'registrationDate': instance.registrationDate,
      'imageUrl': instance.imageUrl,
      'duration': instance.duration,
    };

HomeVolunteerBoardModel _$HomeVolunteerBoardModelFromJson(
        Map<String, dynamic> json) =>
    HomeVolunteerBoardModel(
      location: json['location'] as String,
      volunteers: (json['volunteers'] as List<dynamic>?)
              ?.map((e) =>
                  HomeVolunteerPostModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeVolunteerBoardModelToJson(
        HomeVolunteerBoardModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'volunteers': instance.volunteers.map((e) => e.toJson()).toList(),
    };

HomeCommunityPostModel _$HomeCommunityPostModelFromJson(
        Map<String, dynamic> json) =>
    HomeCommunityPostModel(
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String,
      likes: (json['likes'] as num).toInt(),
      comments: (json['comments'] as num).toInt(),
    );

Map<String, dynamic> _$HomeCommunityPostModelToJson(
        HomeCommunityPostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'likes': instance.likes,
      'comments': instance.comments,
    };

HomeCrewPostModel _$HomeCrewPostModelFromJson(Map<String, dynamic> json) =>
    HomeCrewPostModel(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      membersCount: (json['membersCount'] as num).toInt(),
    );

Map<String, dynamic> _$HomeCrewPostModelToJson(HomeCrewPostModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
      'membersCount': instance.membersCount,
    };

HomeCrewBoardModel _$HomeCrewBoardModelFromJson(Map<String, dynamic> json) =>
    HomeCrewBoardModel(
      location: json['location'] as String,
      crews: (json['crews'] as List<dynamic>?)
              ?.map(
                  (e) => HomeCrewPostModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeCrewBoardModelToJson(HomeCrewBoardModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'crews': instance.crews.map((e) => e.toJson()).toList(),
    };

HomeBoardModel _$HomeBoardModelFromJson(Map<String, dynamic> json) =>
    HomeBoardModel(
      banners: (json['banners'] as List<dynamic>?)
              ?.map((e) => HomeBannerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      volunteers: HomeVolunteerBoardModel.fromJson(
          json['volunteers'] as Map<String, dynamic>),
      communities: (json['communities'] as List<dynamic>)
          .map(
              (e) => HomeCommunityPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      crews: HomeCrewBoardModel.fromJson(json['crews'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeBoardModelToJson(HomeBoardModel instance) =>
    <String, dynamic>{
      'banners': instance.banners.map((e) => e.toJson()).toList(),
      'volunteers': instance.volunteers.toJson(),
      'communities': instance.communities.map((e) => e.toJson()).toList(),
      'crews': instance.crews.toJson(),
    };
