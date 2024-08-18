import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/network_client_service.dart';
import '../../../../core/utils/repository.dart';
import '../../domain/models/login_token.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository(
    client: ref.watch(networkClientServiceProvider),
  );
}

class AuthRemoteRepository extends RemoteRepository {
  AuthRemoteRepository({
    required super.client,
  });

  Future<LoginToken> login({
    required String loginId,
    required String password,
}) async {
    final response = await client.request(
      path: '/user/login',
      method: RequestType.post,
      data: {
        'loginId': loginId,
        'password': password,
      },
    );
    return LoginToken.fromJson(response.data);
  }
}
