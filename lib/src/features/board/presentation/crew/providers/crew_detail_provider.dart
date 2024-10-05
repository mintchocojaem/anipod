import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/crew_detail.dart';
import '../../../domain/use_cases/crew_usecases.dart';

part 'crew_detail_provider.g.dart';

@riverpod
class CrewDetail extends _$CrewDetail {
  @override
  Future<CrewDetailModel> build(String id) async {
    return _fetch();
  }

  Future<CrewDetailModel> _fetch() async {
    // Crew UseCases를 통해 크루 프로필 데이터를 가져옵니다.
    final result = await ref.read(crewUseCasesProvider).getCrewDetail(
          crewId: id,
        );
    return result;
  }

  Future<void> fetch() async {
    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }

  Future<bool> join() async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() async {
      return ref.read(crewUseCasesProvider).joinCrew(
            crewId: id,
          );
    });

    result.whenOrNull(
      data: (data) {
        return data;
      },
      error: (error, stackTrace) {
        state = AsyncError(error, stackTrace);
        return false;
      },
    );

    return false;
  }
}
