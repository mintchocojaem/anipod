import 'package:anipod/src/features/board/presentation/crew/providers/crew_detail_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/crew_wait_list.dart';
import '../../../domain/use_cases/crew_usecases.dart';

part 'crew_wait_list_provider.g.dart';

@riverpod
class CrewWaitList extends _$CrewWaitList {
  @override
  Future<CrewWaitListModel> build(String crewId) async {
    return _fetch();
  }

  Future<CrewWaitListModel> _fetch() async {
    // Crew UseCases를 통해 크루 프로필 데이터를 가져옵니다.
    final result = await ref.read(crewUseCasesProvider).getCrewJoinWaitList(
          crewId: crewId,
        );
    return result;
  }

  Future<void> fetch() async {
    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }

  Future<void> approveJoinRequest({
    required String userId,
  }) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() async {
      return ref.read(crewUseCasesProvider).approveJoinRequest(
            crewId: crewId,
            userId: userId,
          );
    });

    result.whenOrNull(
      data: (data) {
        ref.invalidateSelf();
        ref.invalidate(crewDetailProvider(crewId));
      },
      error: (error, stackTrace) {
        state = AsyncError(error, stackTrace);
      },
    );
  }

  Future<void> rejectJoinRequest({
    required String userId,
  }) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() async {
      return ref.read(crewUseCasesProvider).rejectJoinRequest(
            crewId: crewId,
            userId: userId,
          );
    });

    result.whenOrNull(
      data: (data) {
        ref.invalidateSelf();
      },
      error: (error, stackTrace) {
        state = AsyncError(error, stackTrace);
      },
    );
  }
}
