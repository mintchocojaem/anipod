// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginTokenModel _$LoginTokenModelFromJson(Map<String, dynamic> json) =>
    LoginTokenModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$LoginTokenModelToJson(LoginTokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
