import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/community_remote_repository.dart';
import '../../../domain/models/community_category.dart';
import 'community_board_provider.dart';

part 'community_post_add_provider.g.dart';

@riverpod
class CommunityPostAdd extends _$CommunityPostAdd {
  @override
  Future<void> build() {
    return Future.value(null);
  }

  Future<bool> addPost({
    required String title,
    required String body,
    required CommunityCategoryModel category,
    required List<String> imagesPath,
    required List<String> tags,
    CancelToken? cancelToken,
  }) async {
    // 게시물 추가 상태를 AsyncValue로 관리
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(
      () => ref.read(communityRemoteRepositoryProvider).addPost(
            title: title,
            body: body,
            category: category,
            imagesPath: imagesPath,
            tags: tags,
            cancelToken: cancelToken,
          ),
    );

    result.whenOrNull(
      data: (data) {
        ref.invalidate(communityBoardProvider);
      },
      error: (error, stackTrace) {
        state = AsyncValue.error(error, stackTrace);
      },
    );

    return !result.hasError;
  }
}
