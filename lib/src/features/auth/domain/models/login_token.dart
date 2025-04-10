import 'package:json_annotation/json_annotation.dart';

part 'login_token.g.dart';

@JsonSerializable()
class LoginTokenModel {
  final String accessToken;
  final String refreshToken;

  LoginTokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginTokenModel.fromJson(Map<String, dynamic> json) =>
      _$LoginTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginTokenModelToJson(this);
}
