import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/community_remote_repository.dart';
import '../models/community_board.dart';
import '../models/community_category.dart';
import '../models/community_post_detail.dart';
import '../models/crew.dart';

part 'community_usecases.g.dart';

@riverpod
CommunityUseCases communityUseCases(CommunityUseCasesRef ref) {
  return CommunityUseCases(
    communityRemoteRepository: ref.watch(communityRemoteRepositoryProvider),
  );
}

class CommunityUseCases {
  final CommunityRemoteRepository communityRemoteRepository;

  CommunityUseCases({
    required this.communityRemoteRepository,
  });

  Future<CommunityBoardModel> getCommunityBoard({
    int page = 0, // 페이지 번호
    int size = 10, // 한 페이지당 아이템 수
    CommunityCategoryModel? category, // 카테고리 필터
    CancelToken? cancelToken,
  }) async {
    final result = await communityRemoteRepository.getCommunityBoard(
      page: page,
      size: size,
      category: category,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<List<CrewModel>> getCommunityCrewProfiles({
    int page = 0, // 페이지 번호
    int size = 10, // 한 페이지당 아이템 수
    CancelToken? cancelToken,
  }) async {
    final result = await communityRemoteRepository.getCommunityCrewProfiles(
      page: page,
      size: size,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<bool> addPost({
    required String title,
    required String body,
    required CommunityCategoryModel category,
    required List<String> imagesPath,
    required List<String> tags,
    CancelToken? cancelToken,
  }) async {
    final result = await communityRemoteRepository.addPost(
      title: title,
      body: body,
      category: category,
      imagesPath: imagesPath,
      tags: tags,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<CommunityPostDetailModel> getPostDetail({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final result = await communityRemoteRepository.getPostDetail(
      postId: postId,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<List<CommunityCommentModel>> getPostComments({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final result = await communityRemoteRepository.getPostComments(
      postId: postId,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<bool> addPostComment({
    required String postId,
    required String content,
    CancelToken? cancelToken,
  }) async {
    final result = await communityRemoteRepository.addPostComment(
      postId: postId,
      content: content,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<bool> likePost({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final result = await communityRemoteRepository.likePost(
      postId: postId,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<bool> unlikePost({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final result = await communityRemoteRepository.unlikePost(
      postId: postId,
      cancelToken: cancelToken,
    );
    return result;
  }
}
