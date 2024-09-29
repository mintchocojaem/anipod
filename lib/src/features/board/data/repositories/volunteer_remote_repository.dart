import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/network_client_service.dart';
import '../../../../core/utils/repository.dart';
import '../../domain/models/community_guide.dart';
import '../../domain/models/volunteer_board.dart';
import '../../domain/models/volunteer_category.dart';

part 'volunteer_remote_repository.g.dart';

@riverpod
VolunteerRemoteRepository volunteerRemoteRepository(
    VolunteerRemoteRepositoryRef ref) {
  return VolunteerRemoteRepository(
    client: ref.read(
      networkClientServiceProvider,
    ),
  );
}

class VolunteerRemoteRepository extends RemoteRepository {
  VolunteerRemoteRepository({required super.client});

  Future<VolunteerBoardModel> getVolunteerBoard({
    int page = 0,
    int size = 5,
    VolunteerCategoryModel? category,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path: '/volunteer',
    );

    return VolunteerBoardModel.fromJson(response.data);
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
}
