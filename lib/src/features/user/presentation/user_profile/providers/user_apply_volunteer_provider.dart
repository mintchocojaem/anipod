import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../board/domain/models/volunteer_apply_board.dart';
import '../../../../board/domain/use_cases/volunteer_usecases.dart';

part 'user_apply_volunteer_provider.g.dart';

@riverpod
class UserApplyVolunteer extends _$UserApplyVolunteer {
  @override
  Future<VolunteerApplyBoardModel> build() async {
    return _fetch();
  }

  Future<VolunteerApplyBoardModel> _fetch() async {
    return ref.read(volunteerUseCasesProvider).getApplyVolunteer();
  }
}
