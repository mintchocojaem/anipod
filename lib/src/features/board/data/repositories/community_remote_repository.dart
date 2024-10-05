import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/network_client_service.dart';
import '../../../../core/utils/repository.dart';
import '../../domain/models/community_board.dart';
import '../../domain/models/community_category.dart';
import '../../domain/models/community_post_detail.dart';
import '../../domain/models/crew.dart';
import '../../domain/models/crew_board.dart';

part 'community_remote_repository.g.dart';

@riverpod
CommunityRemoteRepository communityRemoteRepository(
    CommunityRemoteRepositoryRef ref) {
  return CommunityRemoteRepository(
    client: ref.watch(networkClientServiceProvider),
  );
}

class CommunityRemoteRepository extends RemoteRepository {
  CommunityRemoteRepository({required super.client});

  Future<CommunityBoardModel> getCommunityBoard({
    int page = 0,
    int size = 10,
    int bodySize = 50,
    String? keyword,
    CommunityCategoryModel? category,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path: '/post',
      queryParameters: {
        'page': page,
        'size': size,
        'bodySize': bodySize,
        'keyword': keyword,
        'category': category?.value,
        'sort': 'createdAt,desc',
      },
      cancelToken: cancelToken,
    );

    return CommunityBoardModel.fromJson(response.data);
  }

  Future<List<CrewModel>> getCommunityCrewProfiles({
    int page = 0,
    int size = 10,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path: '/crew',
      queryParameters: {
        'page': page,
        'crewCount': size,
        'size': size,
      },
      cancelToken: cancelToken,
    );

    return CrewBoardModel.fromJson(response.data).content;
  }

  Future<bool> addPost({
    required String title,
    required String body,
    required CommunityCategoryModel category,
    required List<String> imagesPath,
    required List<String> tags,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.post,
      path: '/post',
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      data: FormData.fromMap({
        'title': title,
        'body': body,
        'category': category.value,
        if (imagesPath.isNotEmpty)
          'images': imagesPath
              .map((path) => MultipartFile.fromFileSync(
                    path,
                    filename: path.split('/').last,
                    contentType: MediaType.parse(
                      mime(path) ?? 'application/octet-stream',
                    ),
                  ))
              .toList(),
        'peopleCount': 0,
        if (tags.isNotEmpty) 'tags': tags,
      }),
      cancelToken: cancelToken,
    );

    return response.statusCode == 200;
  }

  Future<CommunityPostDetailModel> getPostDetail({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path: '/post/$postId',
      cancelToken: cancelToken,
    );

    return CommunityPostDetailModel.fromJson(response.data);
  }

  Future<List<CommunityCommentModel>> getPostComments({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path: '/post/$postId/comment',
      cancelToken: cancelToken,
    );

    return (response.data as List)
        .map((e) => CommunityCommentModel.fromJson(e))
        .toList();
  }

  Future<bool> addPostComment({
    required String postId,
    required String content,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.post,
      path: '/post/$postId/comment',
      data: {
        'content': content,
      },
      cancelToken: cancelToken,
    );

    return response.statusCode == 200;
  }

  Future<bool> likePost({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.post,
      path: '/post/$postId/like',
      cancelToken: cancelToken,
    );

    return response.statusCode == 200;
  }

  Future<bool> unlikePost({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.delete,
      path: '/post/$postId/like',
      cancelToken: cancelToken,
    );

    return response.statusCode == 200;
  }
}
