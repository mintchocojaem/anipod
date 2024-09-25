import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/community_board.dart';
import '../models/community_category.dart';

part 'community_usecases.g.dart';

@riverpod
class CommunityUseCases extends _$CommunityUseCases {
  @override
  CommunityUseCases build() {
    return CommunityUseCases();
  }

  Future<CommunityBoardModel> getCommunityBoard({
    int page = 0, // 페이지 번호
    int size = 10, // 한 페이지당 아이템 수
    required CommunityCategory category, // 카테고리 필터
    CancelToken? cancelToken,
  }) async {
    await Future.delayed(const Duration(seconds: 1)); // 가상 데이터 로드 시간

    final hasNext = page < 5; // 가상으로 다음 페이지가 있는지 판단
    final communityBoard = CommunityBoardModel(
      posts: List.generate(
        size,
        (index) => CommunityPostModel(
          name: '홍길동',
          title: '제목 $index',
          content: '내용 $index',
          commentCount: index,
          likeCount: index,
          imageUrl: 'https://picsum.photos/200/300?random=$index',
          time: '2021-10-01',
        ),
      ),
      currentPage: page,
      totalPages: 5,
      hasNext: hasNext,
    );

    return communityBoard;
  }

  Future<List<CrewProfileModel>> getCommunityCrewProfiles({
    int page = 0, // 페이지 번호
    int size = 10, // 한 페이지당 아이템 수
    CancelToken? cancelToken,
  }) async {
    await Future.delayed(const Duration(seconds: 1)); // 가상 데이터 로드 시간

    final crewList = List.generate(
      size,
      (index) => CrewProfileModel(
        imageUrl: 'https://picsum.photos/200/300?random=$index',
        name: '홍길동 $index',
      ),
    );

    return crewList;
  }
}
