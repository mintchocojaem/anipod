import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/network_client_service.dart';
import '../../../../core/utils/repository.dart';
import '../../domain/models/crew_board.dart';
import '../../domain/models/crew_category.dart';
import '../../domain/models/crew_detail.dart';
import '../../domain/models/crew_wait_list.dart';

part 'crew_remote_repository.g.dart';

@riverpod
CrewRemoteRepository crewRemoteRepository(CrewRemoteRepositoryRef ref) {
  return CrewRemoteRepository(
    client: ref.watch(networkClientServiceProvider),
  );
}

class CrewRemoteRepository extends RemoteRepository {
  CrewRemoteRepository({required super.client});

  Future<CrewBoardModel> getCrewBoard({
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

    return CrewBoardModel.fromJson(response.data);
  }

  Future<CrewDetailModel> getCrewDetail({
    required String crewId,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path: '/crew/$crewId',
      cancelToken: cancelToken,
    );

    return CrewDetailModel.fromJson(response.data);
  }

  Future<bool> addCrew({
    required CrewCategoryModel category,
    required String name,
    required String description,
    required String neighborhood,
    required CrewAgeLimitModel ageLimit,
    required CrewMaxMemberCountModel maxMemberCount,
    required bool requireApproval,
    required int subscriptionCost,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.post,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      path: '/crew',
      data: FormData.fromMap({
        'type': category.value,
        'name': name,
        'description': description,
        'neighborhood': neighborhood,
        'ageLimit': ageLimit.value,
        'maxMemberCount': maxMemberCount.value,
        'requireApproval': requireApproval,
        'subscriptionCost': subscriptionCost,
      }),
      cancelToken: cancelToken,
    );
    return response.statusCode == 200;
  }

  Future<bool> joinCrew({
    required String crewId,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.post,
      path: '/crew/$crewId/join',
      cancelToken: cancelToken,
    );
    return response.statusCode == 200;
  }

  Future<CrewWaitListModel> getCrewJoinWaitList({
    required String crewId,
    int page = 0,
    int size = 20,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path: '/crew/$crewId/waiting',
      queryParameters: {
        'page': page,
        'size': size,
      },
      cancelToken: cancelToken,
    );
    return CrewWaitListModel.fromJson(response.data);
  }

  Future<bool> approveJoinRequest({
    required String crewId,
    required String userId,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.patch,
      path: '/crew/$crewId/approve/$userId',
      cancelToken: cancelToken,
    );
    return response.statusCode == 200;
  }

  Future<bool> rejectJoinRequest({
    required String crewId,
    required String userId,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.patch,
      path: '/crew/$crewId/reject/$userId',
      cancelToken: cancelToken,
    );
    return response.statusCode == 200;
  }
}
