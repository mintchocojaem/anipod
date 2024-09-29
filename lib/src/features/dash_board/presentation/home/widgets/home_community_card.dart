import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class HomeCommunityCard extends StatelessWidget {
  final String title;
  final String content;
  final String? imageUrl;
  final int likes;
  final int comments;

  const HomeCommunityCard({
    super.key,
    required this.title,
    required this.content,
    this.imageUrl,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: context.palette.surfaceBright,
                  shape: BoxShape.circle,
                  image: imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(imageUrl!),
                          fit: BoxFit.cover,
                          onError: (exception, stackTrace) {
                            print('Image loading error: $exception');
                          },
                        )
                      : null,
                ),
                child: imageUrl == null
                    ? Center(
                        child: OrbIcon(
                          Icons.person_rounded,
                          color: context.palette.surface,
                          size: OrbIconSize.small,
                        ),
                      )
                    : null,
              ),
            ),
            Expanded(
              child: OrbText(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontWeight: OrbFontWeight.medium,
                type: OrbTextType.bodyMedium,
              ),
            ),
            OrbText(
              '좋아요 $likes · 댓글 $comments',
              color: context.palette.surface,
              type: OrbTextType.bodySmall,
              fontWeight: OrbFontWeight.medium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 48,
          child: OrbText(
            content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            type: OrbTextType.bodyMedium,
            fontWeight: OrbFontWeight.regular,
            color: context.palette.surfaceDim,
          ),
        ),
      ],
    );
  }
}
