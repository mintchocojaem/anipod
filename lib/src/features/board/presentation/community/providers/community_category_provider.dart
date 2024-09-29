import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/community_category.dart';

part 'community_category_provider.g.dart';

@riverpod
class CommunityCategory extends _$CommunityCategory {
  @override
  CommunityCategoryModel build() {
    return CommunityCategoryModel.all;
  }

  void selectCategory(CommunityCategoryModel category) {
    state = category;
  }
}
