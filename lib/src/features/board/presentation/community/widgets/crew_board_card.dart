import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/date_time_formatter.dart';
import '../../../../../design_system/orb/orb.dart';

class CrewBoardCard extends StatelessWidget with DateTimeFormatter {
  final String name;
  final String time;
  final String title;
  final String content;
  final int likeCount;
  final String? imageUrl;
  final int commentCount;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const CrewBoardCard({
    super.key,
    required this.name,
    required this.time,
    required this.title,
    required this.content,
    required this.likeCount,
    this.imageUrl,
    required this.commentCount,
    this.padding = const EdgeInsets.all(24),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: context.palette.secondary,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrbText(
                      name,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    OrbText(
                      dateFormatToRelative(time),
                      type: OrbTextType.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Content
                      SizedBox(
                        height: 32,
                        child: OrbText(
                          title,
                          type: OrbTextType.bodyLarge,
                          fontWeight: OrbFontWeight.medium,
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        child: OrbText(
                          content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                if (imageUrl != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
            // Time, like count, and comment count
            Row(
              children: [
                OrbIcon(
                  Icons.thumb_up_alt_outlined,
                  size: OrbIconSize.small,
                ),
                const SizedBox(width: 4),
                OrbText(
                  '$likeCount',
                  type: OrbTextType.bodySmall,
                ),
                const SizedBox(width: 16),
                OrbIcon(
                  Icons.comment_outlined,
                  size: OrbIconSize.small,
                ),
                const SizedBox(width: 4),
                OrbText(
                  '$commentCount',
                  type: OrbTextType.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
