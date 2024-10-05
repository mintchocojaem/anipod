import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/crew_board.dart';
import '../../../domain/use_cases/crew_usecases.dart';

part 'crew_find_board_provider.g.dart';

@riverpod
class CrewFindNewBoard extends _$CrewFindNewBoard {
  @override
  Future<CrewBoardModel> build() async {
    return _fetch();
  }

  Future<CrewBoardModel> _fetch() async {
    // Crew UseCases를 통해 크루 프로필 데이터를 가져옵니다.
    final result = await ref.read(crewUseCasesProvider).getNewCrews();
    return result;
  }

  Future<void> fetch() async {
    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }
}

@riverpod
class CrewFindNeighborhoodBoard extends _$CrewFindNeighborhoodBoard {
  @override
  Future<CrewBoardModel> build() async {
    return _fetch();
  }

  Future<CrewBoardModel> _fetch() async {
    // Crew UseCases를 통해 크루 프로필 데이터를 가져옵니다.
    final result = await ref.read(crewUseCasesProvider).getNeighborhoodCrews();
    return result;
  }

  Future<void> fetch() async {
    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }
}
