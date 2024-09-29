import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/hom_board_remote_repository.dart';
import '../models/home_banner.dart';
import '../models/home_board.dart';

part 'home_board_usecases.g.dart';

@riverpod
HomeBoardUseCases homeBoardUseCases(HomeBoardUseCasesRef ref) {
  return HomeBoardUseCases(
    homeBoardRemoteRepository: ref.watch(homeBoardRemoteRepositoryProvider),
  );
}

class HomeBoardUseCases {
  final HomeBoardRemoteRepository homeBoardRemoteRepository;

  HomeBoardUseCases({
    required this.homeBoardRemoteRepository,
  });

  Future<HomeBoardModel> getHomeBoard({
    CancelToken? cancelToken,
  }) async {
    final result = await homeBoardRemoteRepository.getHomeBoard(
      volunteerCount: 4,
      communityCount: 4,
      crewCount: 4,
    );
    final fakeResult = HomeBoardModel(
      banners: [
        HomeBannerModel(
          id: 1,
          imageUrl: 'https://picsum.photos/600/300',
          redirectUrl: 'https://picsum.photos/600/300',
        ),
      ],
      volunteers: result.volunteers,
      posts: result.posts,
      crews: result.crews,
    );
    return fakeResult;
  }
}
