import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/community_board.dart';
import '../../../domain/models/community_category.dart';
import '../../../domain/use_cases/community_usecases.dart';

part 'community_board_provider.g.dart';

@riverpod
class CommunityBoard extends _$CommunityBoard {
  int _page = 0; // 현재 페이지

  @override
  Future<CommunityBoardModel> build() async {
    return _fetch();
  }

  Future<CommunityBoardModel> _fetch({
    CommunityCategory category = CommunityCategory.all, // 기본값은 모든 카테고리
  }) async {
    final communityBoardData = await ref
        .read(communityUseCasesProvider)
        .getCommunityBoard(page: _page, category: category);
    return communityBoardData;
  }

  Future<void> fetchBoard({
    CommunityCategory category = CommunityCategory.all, // 기본값은 모든 카테고리
  }) async {
    _page = 0; // 페이지를 초기화
    state = await AsyncValue.guard(() async {
      return _fetch(category: category);
    });
  }

  Future<void> fetchNextBoard() async {
    if (state.value?.hasNext == true) {
      _page++; // 페이지를 증가시킴
      state = await AsyncValue.guard(() async {
        final newBoardData = await _fetch();
        final currentPosts = state.value?.posts ?? [];
        return CommunityBoardModel(
          posts: [...currentPosts, ...newBoardData.posts], // 기존 게시물에 새 게시물 추가
          currentPage: newBoardData.currentPage,
          totalPages: newBoardData.totalPages,
          hasNext: newBoardData.hasNext,
        );
      });
    }
  }
}
