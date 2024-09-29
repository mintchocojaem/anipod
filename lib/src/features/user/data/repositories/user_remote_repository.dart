import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/network_client_service.dart';
import '../../../../core/utils/repository.dart';
import '../../domain/models/user.dart';

part 'user_remote_repository.g.dart';

@riverpod
UserRemoteRepository userRemoteRepository(UserRemoteRepositoryRef ref) {
  return UserRemoteRepository(
    client: ref.watch(networkClientServiceProvider),
  );
}

class UserRemoteRepository extends RemoteRepository {
  UserRemoteRepository({
    required super.client,
  });

  Future<UserModel> getUserProfile() async {
    final response = await client.request(
      method: RequestType.get,
      path: '/user',
    );
    return UserModel.fromJson(response.data);
  }
}
