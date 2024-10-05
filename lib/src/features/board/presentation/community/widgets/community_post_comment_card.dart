import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class PostComment {
  final String id;
  final String authorName;
  final String content;
  final String timeAgo;
  final int? likes;
  final List<PostComment> replies;

  PostComment({
    required this.id,
    required this.authorName,
    required this.content,
    required this.timeAgo,
    this.likes,
    this.replies = const [],
  });
}

class CommunityPostCommentCard extends StatelessWidget {
  final PostComment comment;
  final int indentationLevel;

  const CommunityPostCommentCard({
    super.key,
    required this.comment,
    this.indentationLevel = 0,
  });

  @override
  Widget build(BuildContext context) {
    final double avatarRadius = indentationLevel > 0 ? 12 : 16;
    final EdgeInsets contentPadding = EdgeInsets.only(
      left: 32.0 * indentationLevel + (indentationLevel > 0 ? 16 : 0),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 댓글 헤더 부분
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (indentationLevel > 0)
              SizedBox(
                width: 32,
                child: OrbIcon(
                  Icons.subdirectory_arrow_right,
                  size: OrbIconSize.small,
                  color: context.palette.surface,
                ),
              ),
            if (indentationLevel > 0) const SizedBox(width: 16),
            CircleAvatar(
              radius: avatarRadius,
              backgroundColor: context.palette.secondary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OrbText(
                comment.authorName,
                fontWeight: OrbFontWeight.medium,
                type: indentationLevel == 0
                    ? OrbTextType.bodyLarge
                    : OrbTextType.bodyMedium,
              ),
            ),
            if (indentationLevel == 0 && comment.likes != null)
              Row(
                children: [
                  OrbIcon(
                    Icons.thumb_up,
                    size: OrbIconSize.small,
                    color: context.palette.surface,
                  ),
                  const SizedBox(width: 8),
                  OrbText(
                    comment.likes.toString(),
                    fontWeight: OrbFontWeight.medium,
                    color: context.palette.surface,
                  ),
                ],
              ),
          ],
        ),
        // 댓글 내용 부분
        Padding(
          padding: contentPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              OrbText(
                comment.content,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  OrbText(
                    comment.timeAgo,
                    type: OrbTextType.bodySmall,
                  ),
                  const SizedBox(width: 16),
                  if (indentationLevel == 0)
                    InkWell(
                      onTap: () {
                        // 답글 달기 동작 처리
                      },
                      child: OrbText(
                        '답글달기',
                        type: OrbTextType.bodySmall,
                        fontWeight: OrbFontWeight.medium,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        // 답글이 있을 경우 재귀적으로 렌더링
        if (comment.replies.isNotEmpty) ...[
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: comment.replies.map((reply) {
              return CommunityPostCommentCard(
                comment: reply,
                indentationLevel: indentationLevel + 1,
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
