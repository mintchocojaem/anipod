import 'package:anipod/src/features/board/presentation/community/providers/community_crews_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/crew_remote_repository.dart';
import '../../../domain/models/crew_category.dart';

part 'crew_add_provider.g.dart';

class CrewAddState {
  final CrewCategoryModel category;
  final String name;
  final String description;
  final String neighborhood;
  final CrewAgeLimitModel ageLimit;
  final CrewMaxMemberCountModel maxMemberCount;
  final bool requireApproval;
  final int subscriptionCost;

  CrewAddState({
    required this.category,
    required this.name,
    required this.description,
    required this.neighborhood,
    required this.ageLimit,
    required this.maxMemberCount,
    required this.requireApproval,
    required this.subscriptionCost,
  });

  CrewAddState copyWith({
    CrewCategoryModel? category,
    String? name,
    String? description,
    String? neighborhood,
    CrewAgeLimitModel? ageLimit,
    CrewMaxMemberCountModel? maxMemberCount,
    bool? requireApproval,
    int? subscriptionCost,
  }) {
    return CrewAddState(
      category: category ?? this.category,
      name: name ?? this.name,
      description: description ?? this.description,
      neighborhood: neighborhood ?? this.neighborhood,
      ageLimit: ageLimit ?? this.ageLimit,
      maxMemberCount: maxMemberCount ?? this.maxMemberCount,
      requireApproval: requireApproval ?? this.requireApproval,
      subscriptionCost: subscriptionCost ?? this.subscriptionCost,
    );
  }
}

@riverpod
class CrewAdd extends _$CrewAdd {
  @override
  CrewAddState build() {
    return CrewAddState(
      category: CrewCategoryModel.animal,
      name: '',
      description: '',
      neighborhood: '',
      ageLimit: CrewAgeLimitModel.anyone,
      maxMemberCount: CrewMaxMemberCountModel.ten,
      requireApproval: false,
      subscriptionCost: 0,
    );
  }

  void setCategory(CrewCategoryModel category) {
    state = state.copyWith(category: category);
  }

  void setCrewInfo({
    required String name,
    required String description,
    required int subscriptionCost,
  }) {
    state = state.copyWith(
      name: name,
      description: description,
      subscriptionCost: subscriptionCost,
    );
  }

  void setNeighborhood(String neighborhood) {
    state = state.copyWith(neighborhood: neighborhood);
  }

  void setAgeLimit(CrewAgeLimitModel ageLimit) {
    state = state.copyWith(ageLimit: ageLimit);
  }

  void setMaxMemberCount(CrewMaxMemberCountModel maxMemberCount) {
    state = state.copyWith(maxMemberCount: maxMemberCount);
  }

  void setRequireApproval(bool requireApproval) {
    state = state.copyWith(requireApproval: requireApproval);
  }

  Future<bool> crewAdd() async {
    final crewRemoteRepository = ref.watch(crewRemoteRepositoryProvider);
    final result = await crewRemoteRepository.addCrew(
      category: state.category,
      name: state.name,
      description: state.description,
      neighborhood: state.neighborhood,
      ageLimit: state.ageLimit,
      maxMemberCount: state.maxMemberCount,
      requireApproval: state.requireApproval,
      subscriptionCost: state.subscriptionCost,
    );
    ref.invalidate(communityCrewsProvider);
    return result;
  }
}
