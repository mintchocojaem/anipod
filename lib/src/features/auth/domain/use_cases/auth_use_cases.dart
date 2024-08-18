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

  Future<LoginToken> login({
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
}
