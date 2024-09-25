import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/volunteer_board.dart';
import '../models/volunteer_category.dart';

part 'volunteer_usecases.g.dart';

@riverpod
class VolunteerUseCases extends _$VolunteerUseCases {
  @override
  VolunteerUseCases build() {
    return VolunteerUseCases();
  }

  Future<VolunteerBoardModel> getVolunteerBoard({
    int page = 0, // 페이지 번호
    int size = 5, // 한 페이지당 아이템 수
    required VolunteerCategory category,
    CancelToken? cancelToken,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final hasNext = page < 5; // 가상으로 다음 페이지가 있는지 판단
    final volunteerPostList = VolunteerBoardModel(
      contents: List.generate(
        size,
        (index) => VolunteerPostModel(
          id: index,
          title: '봉사 제목 ${index + (page - 1) * size}',
          organization: '봉사 단체',
          region: '서울',
          registrationDate: '2021-10-10',
          imageUrl: 'https://picsum.photos/200/300?random=$index',
          isLiked: false,
          duration: 'D-3',
        ),
      ),
      page: page,
      // 현재 페이지
      size: size,
      // 한 페이지당 아이템 수
      totalPages: 5,
      // 전체 페이지 수
      totalElements: 25,
      // 전체 아이템 수
      hasNext: hasNext,
    );

    return volunteerPostList;
  }

  Future<List<VolunteerGuideModel>> getVolunteerGuide({
    CancelToken? cancelToken,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final guides = [
      VolunteerGuideModel(content: '봉사활동 가이드'),
      VolunteerGuideModel(content: '봉사활동 가이드 2'),
      VolunteerGuideModel(content: '봉사활동 가이드 3'),
    ];
    return guides;
  }

  Future<bool> likeVolunteerPost({
    required int postId,
    required bool isLiked,
    CancelToken? cancelToken,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return isLiked;
  }
}
