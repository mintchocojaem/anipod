import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/user.dart';
import '../../../domain/use_cases/user_use_cases.dart';

part 'user_profile_provider.g.dart';

@riverpod
class UserProfile extends _$UserProfile {
  @override
  Future<UserModel> build() async {
    return _fetch();
  }

  Future<UserModel> _fetch() async {
    return ref.read(userUseCasesProvider).getUserProfile();
  }
}
