import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/community_board.dart';
import '../../../domain/use_cases/community_usecases.dart';

part 'crew_profile_provider.g.dart';

@riverpod
class CrewProfile extends _$CrewProfile {
  @override
  Future<List<CrewProfileModel>> build() async {
    return _fetch();
  }

  Future<List<CrewProfileModel>> _fetch() async {
    // Crew UseCases를 통해 크루 프로필 데이터를 가져옵니다.
    final crewProfiles =
        await ref.read(communityUseCasesProvider).getCommunityCrewProfiles();
    return crewProfiles;
  }

  Future<void> fetchCrewProfiles() async {
    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }
}
