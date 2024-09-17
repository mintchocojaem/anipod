import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';
import '../widgets/community_post_comment_card.dart';

@RoutePage()
class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      padding: EdgeInsets.zero,
      appBar: const OrbAppBar(
        title: '게시글',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: context.palette.secondary,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrbText(
                            'name',
                            fontWeight: OrbFontWeight.medium,
                          ),
                          const SizedBox(height: 4),
                          OrbText(
                            '1시간 전',
                            type: OrbTextType.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  OrbText(
                    '게시글 제목',
                    type: OrbTextType.titleSmall,
                    fontWeight: OrbFontWeight.medium,
                  ),
                  const SizedBox(height: 16),
                  OrbDivider(),
                  const SizedBox(height: 16),
                  OrbText(
                    '게시글 내용\n커뮤니티 내용',
                    type: OrbTextType.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: context.palette.surface,
                          ),
                        ),
                        child: Row(
                          children: [
                            OrbIcon(
                              Icons.thumb_up,
                              size: OrbIconSize.small,
                              color: context.palette.surface,
                            ),
                            const SizedBox(width: 8),
                            OrbText(
                              '좋아요 13',
                              type: OrbTextType.bodySmall,
                              color: context.palette.surface,
                              fontWeight: OrbFontWeight.medium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: context.palette.surface,
                          ),
                        ),
                        child: Row(
                          children: [
                            OrbIcon(
                              Icons.bookmark_outlined,
                              size: OrbIconSize.small,
                              color: context.palette.surface,
                            ),
                            const SizedBox(width: 8),
                            OrbText(
                              '스크랩 13',
                              type: OrbTextType.bodySmall,
                              color: context.palette.surface,
                              fontWeight: OrbFontWeight.medium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const OrbRoundedContainerDivider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    children: [
                      CommunityPostCommentCard(
                        comment: PostComment(
                          id: '1',
                          authorName: '사용자1',
                          content: '이것은 댓글 내용입니다.',
                          timeAgo: '1시간 전',
                          likes: 21,
                          replies: [
                            PostComment(
                              id: '2',
                              authorName: '사용자2',
                              content: '이것은 답글 내용입니다.',
                              timeAgo: '30분 전',
                              likes: 5,
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
      ),
    );
  }
}
