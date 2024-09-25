import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/home_board.dart';
import '../../../domain/usecases/home_board_usecases.dart';

part 'home_board_provider.g.dart';

@riverpod
class HomeBoard extends _$HomeBoard {
  @override
  Future<HomeBoardModel> build() {
    final homeBoard = ref.read(homeBoardUseCasesProvider).getHomeBoard();
    return homeBoard;
  }
}
