import 'package:json_annotation/json_annotation.dart';

import 'home_banner.dart';
import 'home_community_post.dart';
import 'home_crew.dart';
import 'home_volunteer_post.dart';

part 'home_board.g.dart';

@JsonSerializable()
class HomeBoardModel {
  final List<HomeBannerModel> banners;
  final List<HomeVolunteerPostModel> volunteers;
  final List<HomeCommunityPostModel> posts;
  final List<HomeCrewModel> crews;

  HomeBoardModel({
    this.banners = const [],
    required this.volunteers,
    required this.posts,
    required this.crews,
  });

  factory HomeBoardModel.fromJson(Map<String, dynamic> json) =>
      _$HomeBoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBoardModelToJson(this);
}
