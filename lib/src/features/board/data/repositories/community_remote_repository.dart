import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/network_client_service.dart';
import '../../../../core/utils/repository.dart';
import '../../domain/models/community_board.dart';
import '../../domain/models/community_category.dart';
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
        'category':
            category == CommunityCategoryModel.all ? null : category?.value,
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
}
