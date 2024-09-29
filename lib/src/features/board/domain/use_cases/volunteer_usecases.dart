import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/volunteer_remote_repository.dart';
import '../models/community_guide.dart';
import '../models/volunteer_board.dart';
import '../models/volunteer_category.dart';

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
}
