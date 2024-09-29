import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final String nickname;
  final String email;
  final String? profileImageUrl;
  //final String phone;
  //final String address;
  final int totalVolunteerTime;
  final int volunteerCount;
  final int donationCount;

  UserModel({
    this.profileImageUrl,
    required this.nickname,
    required this.email,
    //required this.phone,
    //required this.address,
    required this.totalVolunteerTime,
    required this.volunteerCount,
    required this.donationCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
