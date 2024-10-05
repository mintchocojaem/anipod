import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/network_client_service.dart';
import '../../../../core/utils/repository.dart';
import '../../domain/models/login_token.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository(
    client: ref.watch(networkClientServiceProvider),
  );
}

class AuthRemoteRepository extends RemoteRepository {
  AuthRemoteRepository({
    required super.client,
  });

  Future<LoginTokenModel> login({
    required String loginId,
    required String password,
  }) async {
    final response = await client.request(
      path: '/user/login',
      method: RequestType.post,
      data: {
        'loginId': loginId,
        'password': password,
      },
    );
    return LoginTokenModel.fromJson(response.data);
  }

  Future<bool> sendVerificationCode({
    required String phoneNumber,
  }) async {
    final response = await client.request(
      method: RequestType.post,
      path: '/sms/code',
      data: {
        'phone': phoneNumber,
        'smsType': 'SIGN_UP',
      },
    );
    return response.statusCode == 200;
  }

  Future<bool> checkVerificationCode({
    required String phoneNumber,
    required String code,
  }) async {
    final response = await client.request(
      method: RequestType.post,
      path: '/sms/verify',
      data: {
        'phone': phoneNumber,
        'code': code,
        'smsType': 'SIGN_UP',
      },
    );
    return response.statusCode == 200;
  }

  Future<bool> signUp({
    required String nickname,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    final response = await client.request(
      method: RequestType.post,
      path: '/user/signup',
      data: {
        'loginId': email,
        "birthDate": "1999-01-01",
        "gender": "MALE",
        'nickname': nickname,
        'email': email,
        'password': password,
        'phone': phoneNumber,
      },
    );
    return response.statusCode == 200;
  }
}
