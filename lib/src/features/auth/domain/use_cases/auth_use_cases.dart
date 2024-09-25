import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/auth_local_repository.dart';
import '../../data/repositories/auth_remote_repository.dart';
import '../models/login_token.dart';

part 'auth_use_cases.g.dart';

@riverpod
AuthUseCases authUseCases(AuthUseCasesRef ref) {
  return AuthUseCases(
    authRemoteRepository: ref.watch(authRemoteRepositoryProvider),
    authLocalRepository: ref.watch(authLocalRepositoryProvider),
  );
}

class AuthUseCases {
  final AuthRemoteRepository authRemoteRepository;
  final AuthLocalRepository authLocalRepository;

  AuthUseCases({
    required this.authRemoteRepository,
    required this.authLocalRepository,
  });

  Future<LoginTokenModel> login({
    required String loginId,
    required String password,
  }) async {
    final loginToken = await authRemoteRepository.login(
      loginId: loginId,
      password: password,
    );

    authLocalRepository.saveLoginToken(
      token: loginToken,
    );
    return loginToken;
  }

  void deleteSavedLoginToken() {
    authLocalRepository.deleteLoginToken();
  }

  Future<bool> sendVerificationCode({
    required String phoneNumber,
  }) async {
    return await authRemoteRepository.sendVerificationCode(
      phoneNumber: phoneNumber,
    );
  }

  Future<bool> checkVerificationCode({
    required String phoneNumber,
    required String code,
  }) async {
    return await authRemoteRepository.checkVerificationCode(
      phoneNumber: phoneNumber,
      code: code,
    );
  }

  Future<bool> signUp({
    required String email,
    required String phoneNumber,
    required String nickname,
    required String password,
  }) async {
    return await authRemoteRepository.signUp(
      phoneNumber: phoneNumber,
      nickname: nickname,
      email: email,
      password: password,
    );
  }
}
