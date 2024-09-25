import 'dart:math';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/hom_board_remote_repository.dart';
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
    /*
    final result = await homeBoardRemoteRepository.getHomeBoard(
      volunteerCount: 4,
      communityCount: 4,
      crewCount: 4,
    );
    result.banners.add(HomeBannerModel(
      id: 1,
      imageUrl: 'https://via.placeholder.com/150',
      redirectUrl: 'https://www.google.com',
    ));
    return result;
     */
    await Future.delayed(const Duration(seconds: 1));
    final random = Random();
    final homeBoard = HomeBoardModel(
      banners: [
        HomeBannerModel(
          id: 1,
          imageUrl:
              'https://picsum.photos/1024/512?random=${random.nextInt(100)}',
          redirectUrl: 'https://via.placeholder.com/200',
        ),
        HomeBannerModel(
          id: 2,
          imageUrl:
              'https://picsum.photos/1024/512?random=${random.nextInt(100)}',
          redirectUrl: 'https://via.placeholder.com/200',
        ),
      ],
      volunteers: HomeVolunteerBoardModel(
        location: '서울',
        volunteers: [
          HomeVolunteerPostModel(
            title: '봉사 제목',
            organizationName: '봉사 단체',
            region: '서울',
            registrationDate: '2021-10-10',
            imageUrl: 'https://picsum.photos/200?random=${random.nextInt(100)}',
            duration: '3일',
          ),
          HomeVolunteerPostModel(
            title: '봉사 제목',
            organizationName: '봉사 단체',
            region: '서울',
            registrationDate: '2021-10-10',
            imageUrl: 'https://picsum.photos/200?random=${random.nextInt(100)}',
            duration: '3일',
          ),
        ],
      ),
      communities: [
        HomeCommunityPostModel(
          title: '커뮤니티 제목',
          content: '커뮤니티 내용\nasd',
          imageUrl: 'https://picsum.photos/128?random=${random.nextInt(100)}',
          likes: 10,
          comments: 5,
        ),
        HomeCommunityPostModel(
          title: '커뮤니티 제목',
          content: '커뮤니티 내용\nasd',
          imageUrl: 'https://picsum.photos/128?random=${random.nextInt(100)}',
          likes: 10,
          comments: 5,
        ),
      ],
      crews: HomeCrewBoardModel(
        location: '서울',
        crews: [
          HomeCrewPostModel(
            imageUrl: 'https://picsum.photos/256?random=${random.nextInt(100)}',
            title: '크루 제목',
            description: '크루 설명\nasd',
            location: '서울',
            membersCount: 3,
          ),
          HomeCrewPostModel(
            imageUrl: 'https://picsum.photos/256?random=${random.nextInt(100)}',
            title: '크루 제목',
            description: '크루 설명\nasd',
            location: '서울',
            membersCount: 5,
          ),
        ],
      ),
    );

    return homeBoard;
  }
}
