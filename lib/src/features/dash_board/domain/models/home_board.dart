import 'package:json_annotation/json_annotation.dart';

part 'home_board.g.dart';

@JsonSerializable()
class HomeBannerModel {
  final int id;
  final String imageUrl;
  final String redirectUrl;

  HomeBannerModel({
    required this.id,
    required this.imageUrl,
    required this.redirectUrl,
  });

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerModelToJson(this);
}

@JsonSerializable()
class HomeVolunteerPostModel {
  final String title;
  final String organizationName;
  final String region;
  final String registrationDate;
  final String imageUrl;
  final String duration;

  HomeVolunteerPostModel({
    required this.title,
    required this.organizationName,
    required this.region,
    required this.registrationDate,
    required this.imageUrl,
    required this.duration,
  });

  factory HomeVolunteerPostModel.fromJson(Map<String, dynamic> json) =>
      _$HomeVolunteerPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeVolunteerPostModelToJson(this);
}

@JsonSerializable()
class HomeVolunteerBoardModel {
  final String location;
  final List<HomeVolunteerPostModel> volunteers;

  HomeVolunteerBoardModel({
    required this.location,
    this.volunteers = const [],
  });

  factory HomeVolunteerBoardModel.fromJson(Map<String, dynamic> json) =>
      _$HomeVolunteerBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeVolunteerBoardModelToJson(this);
}

@JsonSerializable()
class HomeCommunityPostModel {
  final String title;
  final String content;
  final String imageUrl;
  final int likes;
  final int comments;

  HomeCommunityPostModel({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });

  factory HomeCommunityPostModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCommunityPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCommunityPostModelToJson(this);
}

@JsonSerializable()
class HomeCrewPostModel {
  final String imageUrl;
  final String title;
  final String description;
  final String location;
  final int membersCount;

  HomeCrewPostModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.location,
    required this.membersCount,
  });

  factory HomeCrewPostModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCrewPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCrewPostModelToJson(this);
}

@JsonSerializable()
class HomeCrewBoardModel {
  final String location;
  final List<HomeCrewPostModel> crews;

  HomeCrewBoardModel({
    required this.location,
    this.crews = const [],
  });

  factory HomeCrewBoardModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCrewBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCrewBoardModelToJson(this);
}

@JsonSerializable()
class HomeBoardModel {
  final List<HomeBannerModel> banners;
  final HomeVolunteerBoardModel volunteers;
  final List<HomeCommunityPostModel> communities;
  final HomeCrewBoardModel crews;

  HomeBoardModel({
    this.banners = const [],
    required this.volunteers,
    required this.communities,
    required this.crews,
  });

  factory HomeBoardModel.fromJson(Map<String, dynamic> json) =>
      _$HomeBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBoardModelToJson(this);
}
