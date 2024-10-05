import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/community_post_detail.dart';
import '../../../domain/use_cases/community_usecases.dart';

part 'community_post_detail_provider.g.dart';

class CommunityPostDetailState {
  final CommunityPostDetailModel postDetail;
  final List<CommunityCommentModel> comments;

  CommunityPostDetailState({
    required this.postDetail,
    required this.comments,
  });
}

@riverpod
class CommunityPostDetail extends _$CommunityPostDetail {
  @override
  Future<CommunityPostDetailState> build(String postId) async {
    return _fetch();
  }

  Future<CommunityPostDetailState> _fetch() async {
    final communityUseCases = ref.read(communityUseCasesProvider);
    final postDetail = await communityUseCases.getPostDetail(postId: postId);
    final comments = await communityUseCases.getPostComments(postId: postId);
    return CommunityPostDetailState(
      postDetail: postDetail,
      comments: comments,
    );
  }

  Future<void> fetch() async {
    state = await AsyncValue.guard(_fetch);
  }

  Future<void> addComment({
    required String body,
  }) async {
    await AsyncValue.guard(
        () => ref.read(communityUseCasesProvider).addPostComment(
              postId: postId,
              content: body,
            ));
    ref.invalidateSelf();
  }

  Future<void> likePost() async {
    await AsyncValue.guard(
        () => ref.read(communityUseCasesProvider).likePost(postId: postId));
    ref.invalidateSelf();
  }

  Future<void> unlikePost() async {
    await AsyncValue.guard(
        () => ref.read(communityUseCasesProvider).unlikePost(postId: postId));
    ref.invalidateSelf();
  }
}
