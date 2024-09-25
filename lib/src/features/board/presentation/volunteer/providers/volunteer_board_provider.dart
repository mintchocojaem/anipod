import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/volunteer_board.dart';
import '../../../domain/models/volunteer_category.dart';
import '../../../domain/use_cases/volunteer_usecases.dart';

part 'volunteer_board_provider.g.dart';

@riverpod
class VolunteerBoard extends _$VolunteerBoard {
  int _page = 0; // 현재 페이지

  @override
  Future<VolunteerBoardModel> build() async {
    return _fetch();
  }

  Future<VolunteerBoardModel> _fetch({
    VolunteerCategory category = VolunteerCategory.all,
  }) async {
    final volunteerBoardData = await ref
        .read(volunteerUseCasesProvider)
        .getVolunteerBoard(page: _page, category: category);
    return volunteerBoardData;
  }

  Future<void> fetchBoard({
    VolunteerCategory category = VolunteerCategory.all,
  }) async {
    _page = 0; // 페이지 초기화
    state = await AsyncValue.guard(() async {
      return _fetch(category: category);
    });
  }

  Future<void> fetchNextBoard() async {
    if (state.value?.hasNext == true) {
      _page++; // 페이지 증가
      state = await AsyncValue.guard(() async {
        final newBoardData = await _fetch();
        final currentPosts = state.value?.contents ?? [];
        return VolunteerBoardModel(
          contents: [...currentPosts, ...newBoardData.contents],
          page: newBoardData.page,
          size: newBoardData.size,
          totalPages: newBoardData.totalPages,
          totalElements: newBoardData.totalElements,
          hasNext: newBoardData.hasNext,
        );
      });
    }
  }
}

@riverpod
Future<bool> likeVolunteerPost(
  LikeVolunteerPostRef ref, {
  required int postId,
  required bool isLiked,
  CancelToken? cancelToken,
}) async {
  final userUseCases = ref.read(volunteerUseCasesProvider);
  return userUseCases.likeVolunteerPost(
    postId: postId,
    isLiked: isLiked,
    cancelToken: cancelToken,
  );
}
