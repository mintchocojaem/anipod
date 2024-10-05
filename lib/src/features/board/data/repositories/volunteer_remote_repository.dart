import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/network_client_service.dart';
import '../../../../core/utils/repository.dart';
import '../../domain/models/community_guide.dart';
import '../../domain/models/volunteer_apply_board.dart';
import '../../domain/models/volunteer_board.dart';
import '../../domain/models/volunteer_category.dart';
import '../../domain/models/volunteer_post_detail.dart';

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
      queryParameters: {
        'page': page,
        'size': size,
        'category': category?.value,
        'sort': 'createdAt,desc',
      },
    );

    return VolunteerBoardModel.fromJson(response.data);
  }

  Future<List<VolunteerGuideModel>> getVolunteerGuide({
    CancelToken? cancelToken,
  }) async {
    final guides = [
      VolunteerGuideModel(content: '봉사활동 가이드'),
      VolunteerGuideModel(content: '봉사활동 가이드 2'),
      VolunteerGuideModel(content: '봉사활동 가이드 3'),
    ];
    return guides;
  }

  Future<VolunteerPostDetailModel> getPostDetail({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path: '/shelter/volunteer/$postId',
    );

    return VolunteerPostDetailModel.fromJson(response.data);
  }

  Future<bool> applyVolunteer({
    required String volunteerId,
    required String userName,
    required String birthDate,
    required String phone,
    required String hopeDate,
    required String hopeTime,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.post,
      path: '/user/volunteer/apply',
      data: {
        'volunteerId': volunteerId,
        'userName': userName,
        'birthDate': birthDate,
        'phone': phone,
        'hopeDate': hopeDate,
        'hopeTime': hopeTime,
      },
    );

    return response.statusCode == 200;
  }

  Future<VolunteerApplyBoardModel> getApplyVolunteer({
    int page = 0,
    int size = 20,
    CancelToken? cancelToken,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path: '/user/volunteer/my',
      queryParameters: {
        'page': page,
        'size': size,
      },
    );
    return VolunteerApplyBoardModel.fromJson(response.data);
  }
}
