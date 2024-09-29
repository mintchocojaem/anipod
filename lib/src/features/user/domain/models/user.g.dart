// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      profileImageUrl: json['profileImageUrl'] as String?,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      totalVolunteerTime: (json['totalVolunteerTime'] as num).toInt(),
      volunteerCount: (json['volunteerCount'] as num).toInt(),
      donationCount: (json['donationCount'] as num).toInt(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'email': instance.email,
      'profileImageUrl': instance.profileImageUrl,
      'totalVolunteerTime': instance.totalVolunteerTime,
      'volunteerCount': instance.volunteerCount,
      'donationCount': instance.donationCount,
    };
