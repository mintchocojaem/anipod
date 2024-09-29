import 'package:json_annotation/json_annotation.dart';

part 'home_banner.g.dart';

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
