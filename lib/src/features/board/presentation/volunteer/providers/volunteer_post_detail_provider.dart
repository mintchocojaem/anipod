import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/volunteer_remote_repository.dart';
import '../../../domain/models/volunteer_post_detail.dart';

part 'volunteer_post_detail_provider.g.dart';

@riverpod
class VolunteerPostDetail extends _$VolunteerPostDetail {
  @override
  Future<VolunteerPostDetailModel> build(String postId) async {
    return _fetch();
  }

  Future<VolunteerPostDetailModel> _fetch() async {
    return ref
        .read(volunteerRemoteRepositoryProvider)
        .getPostDetail(postId: postId);
  }

  Future<void> fetch() async {
    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }

  Future<bool> apply({
    required String userName,
    required String birthDate,
    required String phone,
    required String hopeDate,
    required String hopeTime,
  }) async {
    final result = await AsyncValue.guard(
      () => ref.read(volunteerRemoteRepositoryProvider).applyVolunteer(
            volunteerId: postId,
            userName: userName,
            birthDate: birthDate,
            phone: phone,
            hopeDate: hopeDate,
            hopeTime: hopeTime,
          ),
    );

    result.whenOrNull(
      error: (error, stackTrace) {
        state = AsyncValue.error(error, stackTrace);
      },
    );

    return !result.hasError;
  }
}
