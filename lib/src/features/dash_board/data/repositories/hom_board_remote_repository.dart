import 'package:anipod/src/features/dash_board/domain/models/home_board.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/network_client_service.dart';
import '../../../../core/utils/repository.dart';

part 'hom_board_remote_repository.g.dart';

@riverpod
HomeBoardRemoteRepository homeBoardRemoteRepository(
    HomeBoardRemoteRepositoryRef ref) {
  return HomeBoardRemoteRepository(
    client: ref.watch(networkClientServiceProvider),
  );
}

class HomeBoardRemoteRepository extends RemoteRepository {
  HomeBoardRemoteRepository({
    required super.client,
  });

  Future<HomeBoardModel> getHomeBoard({
    required int volunteerCount,
    required int communityCount,
    required int crewCount,
  }) async {
    final response = await client.request(
      method: RequestType.get,
      path:
          '/mainpage?volunteerCount=$volunteerCount&communityCount=$communityCount&crewCount=$crewCount',
    );
    return HomeBoardModel.fromJson(response.data);
  }
}
