import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/login_token.dart';
import '../../../domain/use_cases/auth_use_cases.dart';

part 'login_token_provider.g.dart';

@Riverpod(keepAlive: true)
class LoginToken extends _$LoginToken {
  @override
  FutureOr<LoginTokenModel?> build() {
    // TODO: implement build
    return null;
  }

  Future<void> login({
    required String loginId,
    required String password,
  }) async {
    state = await AsyncValue.guard(
      () => ref.read(authUseCasesProvider).login(
            loginId: loginId,
            password: password,
          ),
    );
  }

  void logout() {
    state = const AsyncData(null);
    ref.read(authUseCasesProvider).deleteSavedLoginToken();
  }
}
