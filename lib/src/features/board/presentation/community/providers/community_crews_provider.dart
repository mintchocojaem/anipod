import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/crew.dart';
import '../../../domain/use_cases/community_usecases.dart';

part 'community_crews_provider.g.dart';

@riverpod
class CommunityCrews extends _$CommunityCrews {
  @override
  Future<List<CrewModel>> build() async {
    return _fetch();
  }

  Future<List<CrewModel>> _fetch() async {
    // Crew UseCases를 통해 크루 프로필 데이터를 가져옵니다.
    final crewProfiles =
        await ref.read(communityUseCasesProvider).getCommunityCrewProfiles();
    return crewProfiles;
  }

  Future<void> fetch() async {
    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }
}
