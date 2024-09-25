import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/auth_remote_repository.dart';

part 'sign_up_provider.g.dart';

@riverpod
class SignUp extends _$SignUp {
  late final AuthRemoteRepository authRemoteRepository;

  String phoneNumber = '';

  @override
  FutureOr<void> build() async {
    authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    return null;
  }

  void setPhoneNumber({required String phoneNumber}) {
    this.phoneNumber = phoneNumber;
  }

  Future<bool> sendVerificationCode() async {
    state = const AsyncValue.loading();
    final response = await AsyncValue.guard(() {
      return authRemoteRepository.sendVerificationCode(
        phoneNumber: phoneNumber,
      );
    });
    state = response;

    if (response.hasValue) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkVerificationCode({
    required String code,
  }) async {
    state = const AsyncValue.loading();
    final response = await AsyncValue.guard(() {
      return authRemoteRepository.checkVerificationCode(
        phoneNumber: phoneNumber,
        code: code,
      );
    });
    state = response;

    if (response.hasValue) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp({
    required String nickname,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final response = await AsyncValue.guard(() {
      return authRemoteRepository.signUp(
        nickname: nickname,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
    });
    state = response;

    if (response.hasValue) {
      return true;
    } else {
      return false;
    }
  }
}
