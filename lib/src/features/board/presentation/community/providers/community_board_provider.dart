import 'package:anipod/src/features/board/domain/models/community_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/community_board.dart';
import '../../../domain/use_cases/community_usecases.dart';
import 'community_category_provider.dart';

part 'community_board_provider.g.dart';

@riverpod
class CommunityBoard extends _$CommunityBoard {
  int _page = 0; // 현재 페이지

  @override
  Future<CommunityBoardModel> build() async {
    final category = ref.watch(communityCategoryProvider);
    return _fetch(category: category);
  }

  Future<CommunityBoardModel> _fetch({
    CommunityCategoryModel? category,
  }) async {
    final communityBoardData = await ref
        .read(communityUseCasesProvider)
        .getCommunityBoard(page: _page, category: category);
    return communityBoardData;
  }

  Future<void> fetch() async {
    _page = 0; // 페이지를 초기화
    state = await AsyncValue.guard(() async {
      return _fetch(
        category: ref.read(communityCategoryProvider),
      );
    });
  }

  Future<void> fetchNext() async {
    if (state.value?.hasNext == true) {
      _page++; // 페이지를 증가시킴
      state = await AsyncValue.guard(() async {
        final category = ref.read(communityCategoryProvider);
        final newBoardData = await _fetch(
          category: category,
        );
        final currentPosts = state.value?.content ?? [];
        return CommunityBoardModel(
          content: [
            ...currentPosts,
            ...newBoardData.content
          ], // 기존 게시물에 새 게시물 추가
          totalPages: newBoardData.totalPages,
          totalElements: newBoardData.totalElements,
          hasNext: newBoardData.hasNext,
        );
      });
    }
  }
}
