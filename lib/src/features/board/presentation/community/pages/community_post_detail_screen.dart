import 'package:anipod/src/core/utils/date_time_formatter.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_exception.dart';
import '../../../../../design_system/orb/orb.dart';
import '../providers/community_post_detail_provider.dart';
import '../widgets/community_post_comment_card.dart';

@RoutePage()
class CommunityPostDetailScreen extends StatelessWidget with DateTimeFormatter {
  final String postId;

  const CommunityPostDetailScreen({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final postDetail = ref.watch(communityPostDetailProvider(postId));

      ref.listen(
        communityPostDetailProvider(postId),
        (_, next) {
          if (!next.isLoading && next.hasError) {
            final error = next.error;
            if (error is! AppException) return;
            context.showErrorSnackBar(
              error: error,
            );
          }
        },
      );

      return OrbScaffold(
        padding: EdgeInsets.zero,
        appBar: const OrbAppBar(
          title: '게시글',
          centerTitle: true,
        ),
        body: OrbRefreshIndicator(
          onRefresh: () async {
            ref.invalidate(communityPostDetailProvider(postId));
          },
          child: HookBuilder(builder: (context) {
            final messageController = useTextEditingController();

            return postDetail.when(
              data: (data) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 24),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundColor:
                                            context.palette.secondary,
                                      ),
                                      const SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          OrbText(
                                            data.postDetail.author,
                                            fontWeight: OrbFontWeight.medium,
                                          ),
                                          const SizedBox(height: 4),
                                          OrbText(
                                            dateFormatToRelative(
                                                data.postDetail.createdAt),
                                            type: OrbTextType.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  OrbText(
                                    data.postDetail.title,
                                    type: OrbTextType.titleSmall,
                                    fontWeight: OrbFontWeight.medium,
                                  ),
                                  const SizedBox(height: 16),
                                  OrbDivider(),
                                  const SizedBox(height: 16),
                                  OrbText(
                                    data.postDetail.body,
                                    type: OrbTextType.bodyMedium,
                                  ),
                                  const SizedBox(height: 24),
                                  if (data.postDetail.images.isNotEmpty)
                                    data.postDetail.images.length == 1
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              data.postDetail.images.first.url,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Container(
                                                width: 128,
                                                height: 128,
                                                color: context
                                                    .palette.surfaceBright,
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 128,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  data.postDetail.images.length,
                                              itemBuilder: (context, index) {
                                                final image = data
                                                    .postDetail.images[index];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16),
                                                  child: Container(
                                                    width: 128,
                                                    height: 128,
                                                    decoration: BoxDecoration(
                                                      color: context.palette
                                                          .surfaceBright,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        8,
                                                      ),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          image.url,
                                                        ),
                                                        fit: BoxFit.cover,
                                                        onError: (error,
                                                            stackTrace) {
                                                          print(
                                                              "Image loading error $error");
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          final isLiked = data.postDetail.liked;

                                          if (isLiked) {
                                            ref
                                                .read(
                                                    communityPostDetailProvider(
                                                            postId)
                                                        .notifier)
                                                .unlikePost();
                                          } else {
                                            ref
                                                .read(
                                                    communityPostDetailProvider(
                                                            postId)
                                                        .notifier)
                                                .likePost();
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                              color: data.postDetail.liked
                                                  ? context.palette.primary
                                                  : context.palette.surface,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              OrbIcon(
                                                Icons.thumb_up,
                                                size: OrbIconSize.small,
                                                color: data.postDetail.liked
                                                    ? context.palette.primary
                                                    : context.palette.surface,
                                              ),
                                              const SizedBox(width: 8),
                                              OrbText(
                                                '좋아요 ${data.postDetail.likes}',
                                                type: OrbTextType.bodySmall,
                                                color: data.postDetail.liked
                                                    ? context.palette.primary
                                                    : context.palette.surface,
                                                fontWeight:
                                                    OrbFontWeight.medium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const OrbRoundedContainerDivider(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      OrbText(
                                        '댓글 ${data.comments.length}',
                                        type: OrbTextType.bodyLarge,
                                        fontWeight: OrbFontWeight.medium,
                                      ),
                                      const SizedBox(height: 24),
                                      const OrbDivider(),
                                      const SizedBox(height: 24),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: data.comments.length,
                                  itemBuilder: (context, index) {
                                    final comment = data.comments[index];
                                    final replies = comment.replies;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      child: Column(
                                        children: [
                                          CommunityPostCommentCard(
                                            comment: PostComment(
                                              id: comment.id,
                                              authorName: comment.author,
                                              content: comment.content,
                                              timeAgo: dateFormatToRelative(
                                                  comment.createdAt),
                                              likes: 0,
                                              replies: [
                                                ...replies.map(
                                                  (reply) => PostComment(
                                                    id: reply.id,
                                                    authorName: reply.author,
                                                    content: reply.content,
                                                    timeAgo:
                                                        dateFormatToRelative(
                                                            reply.createdAt),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 24,
                                            ),
                                            child: OrbDivider(),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: context.palette.background,
                        boxShadow: [
                          BoxShadow(
                            color: context.palette.surfaceBright,
                            offset: const Offset(0, -2),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: OrbTextField(
                        hintText: '댓글을 입력해주세요',
                        controller: messageController,
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            await ref
                                .read(communityPostDetailProvider(postId)
                                    .notifier)
                                .addComment(
                                  body: messageController.text,
                                );
                            messageController.clear();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: OrbIcon(
                              Icons.send,
                              color: context.palette.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(
                child: OrbCircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: OrbCircularProgressIndicator(),
              ),
            );
          }),
        ),
      );
    });
  }
}
