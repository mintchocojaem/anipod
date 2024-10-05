import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/crew_remote_repository.dart';
import '../models/crew_board.dart';
import '../models/crew_category.dart';
import '../models/crew_detail.dart';
import '../models/crew_wait_list.dart';

part 'crew_usecases.g.dart';

@riverpod
CrewUseCases crewUseCases(CrewUseCasesRef ref) {
  return CrewUseCases(
    crewRemoteRepository: ref.watch(crewRemoteRepositoryProvider),
  );
}

class CrewUseCases {
  final CrewRemoteRepository crewRemoteRepository;

  CrewUseCases({
    required this.crewRemoteRepository,
  });

  Future<CrewBoardModel> getNewCrews({
    int page = 0, // 페이지 번호
    int size = 5, // 한 페이지당 아이템 수
    CancelToken? cancelToken,
  }) async {
    final result = await crewRemoteRepository.getCrewBoard(
      page: page,
      size: size,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<CrewBoardModel> getNeighborhoodCrews({
    int page = 0, // 페이지 번호
    int size = 20, // 한 페이지당 아이템 수
    CancelToken? cancelToken,
  }) async {
    final result = await crewRemoteRepository.getCrewBoard(
      page: page,
      size: size,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<CrewDetailModel> getCrewDetail({
    required String crewId,
    CancelToken? cancelToken,
  }) async {
    final result = await crewRemoteRepository.getCrewDetail(
      crewId: crewId,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<void> addCrew({
    required CrewCategoryModel category,
    required String name,
    required String description,
    required String neighborhood,
    required CrewAgeLimitModel ageLimit,
    required CrewMaxMemberCountModel maxMemberCount,
    required bool requireApproval,
    String? profileImagePath,
    String? backgroundImagePath,
    required int subscriptionCost,
    CancelToken? cancelToken,
  }) async {
    await crewRemoteRepository.addCrew(
      category: category,
      name: name,
      description: description,
      neighborhood: neighborhood,
      ageLimit: ageLimit,
      maxMemberCount: maxMemberCount,
      requireApproval: requireApproval,
      subscriptionCost: subscriptionCost,
      cancelToken: cancelToken,
    );
  }

  Future<bool> joinCrew({
    required String crewId,
    CancelToken? cancelToken,
  }) async {
    final result = await crewRemoteRepository.joinCrew(
      crewId: crewId,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<CrewWaitListModel> getCrewJoinWaitList({
    required String crewId, // 크루 아이디
    int page = 0, // 페이지 번호
    int size = 20, // 한 페이지당 아이템 수
    CancelToken? cancelToken,
  }) async {
    final result = await crewRemoteRepository.getCrewJoinWaitList(
      crewId: crewId,
      page: page,
      size: size,
      cancelToken: cancelToken,
    );
    return result;
  }

  Future<bool> approveJoinRequest({
    required String crewId,
    required String userId,
    CancelToken? cancelToken,
  }) async {
    return await crewRemoteRepository.approveJoinRequest(
      crewId: crewId,
      userId: userId,
      cancelToken: cancelToken,
    );
  }

  Future<bool> rejectJoinRequest({
    required String crewId,
    required String userId,
    CancelToken? cancelToken,
  }) async {
    return await crewRemoteRepository.rejectJoinRequest(
      crewId: crewId,
      userId: userId,
      cancelToken: cancelToken,
    );
  }
}
