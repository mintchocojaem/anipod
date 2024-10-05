import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/file.dart';

part 'crew_detail.g.dart';

@JsonSerializable()
class CrewDetailMemberModel {
  final String nickname;
  final File? profileImageUrl;

  CrewDetailMemberModel({
    required this.nickname,
    this.profileImageUrl,
  });

  factory CrewDetailMemberModel.fromJson(Map<String, dynamic> json) =>
      _$CrewDetailMemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewDetailMemberModelToJson(this);
}

@JsonSerializable()
class CrewDetailModel {
  final String name;
  final String description;
  final List<String> tag;
  final String? profileImageUrl;
  final String? backgroundImageUrl;
  final int imageCount;
  final List<File> images;
  final int memberCount;
  final List<CrewDetailMemberModel> members;
  final bool member;

  CrewDetailModel({
    this.name = '크루 이름',
    required this.description,
    this.tag = const [],
    this.profileImageUrl,
    this.backgroundImageUrl,
    required this.imageCount,
    required this.images,
    required this.memberCount,
    required this.members,
    required this.member,
  });

  factory CrewDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CrewDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewDetailModelToJson(this);
}
