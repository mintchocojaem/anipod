import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/user.dart';

part 'user_use_cases.g.dart';

@riverpod
class UserUseCases extends _$UserUseCases {
  @override
  UserUseCases build() {
    return UserUseCases();
  }

  Future<UserModel> getUserProfile() async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      imageUrl: 'https://picsum.photos/200',
      name: '이름',
      email: 'example@naver.com',
      phone: '010-1234-5678',
      address: '서울시 강남구',
      volunteerHours: '100',
      volunteerCount: '3',
      backingCount: '1',
    );
  }
}
