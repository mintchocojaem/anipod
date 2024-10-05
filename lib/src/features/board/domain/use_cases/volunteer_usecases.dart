import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/volunteer_remote_repository.dart';
import '../models/community_guide.dart';
import '../models/volunteer_apply_board.dart';
import '../models/volunteer_board.dart';
import '../models/volunteer_category.dart';
import '../models/volunteer_post_detail.dart';

part 'volunteer_usecases.g.dart';

@riverpod
VolunteerUseCases volunteerUseCases(VolunteerUseCasesRef ref) {
  return VolunteerUseCases(
    volunteerRemoteRepository: ref.read(volunteerRemoteRepositoryProvider),
  );
}

class VolunteerUseCases {
  final VolunteerRemoteRepository volunteerRemoteRepository;

  VolunteerUseCases({required this.volunteerRemoteRepository});

  Future<VolunteerBoardModel> getVolunteerBoard({
    int page = 0, // 페이지 번호
    int size = 5, // 한 페이지당 아이템 수
    VolunteerCategoryModel? category,
    CancelToken? cancelToken,
  }) async {
    final response = await volunteerRemoteRepository.getVolunteerBoard(
      page: page,
      size: size,
      category: category,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<List<VolunteerGuideModel>> getVolunteerGuide({
    CancelToken? cancelToken,
  }) async {
    final response = await volunteerRemoteRepository.getVolunteerGuide(
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<VolunteerPostDetailModel> getPostDetail({
    required String postId,
    CancelToken? cancelToken,
  }) async {
    final response = await volunteerRemoteRepository.getPostDetail(
      postId: postId,
      cancelToken: cancelToken,
    );
    return response;
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
    final response = await volunteerRemoteRepository.applyVolunteer(
      volunteerId: volunteerId,
      userName: userName,
      birthDate: birthDate,
      phone: phone,
      hopeDate: hopeDate,
      hopeTime: hopeTime,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<VolunteerApplyBoardModel> getApplyVolunteer({
    int page = 0,
    int size = 20,
    CancelToken? cancelToken,
  }) async {
    final response = await volunteerRemoteRepository.getApplyVolunteer(
      page: page,
      size: size,
      cancelToken: cancelToken,
    );
    return response;
  }
}
