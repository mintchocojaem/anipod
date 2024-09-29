import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/community_guide.dart';
import '../../../domain/use_cases/volunteer_usecases.dart';

part 'volunteer_guide_provider.g.dart';

@riverpod
class VolunteerGuide extends _$VolunteerGuide {
  @override
  Future<List<VolunteerGuideModel>> build() async {
    return _fetch();
  }

  Future<List<VolunteerGuideModel>> _fetch() async {
    final volunteerGuide =
        await ref.read(volunteerUseCasesProvider).getVolunteerGuide();
    return volunteerGuide;
  }

  Future<void> fetchGuide() async {
    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }
}
