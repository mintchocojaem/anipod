import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class CommunityListItem extends StatelessWidget {
  final String title;
  final List<String> tags;
  final String content;
  final String time;
  final int likeCount;
  final int commentCount;
  final String imageUrl;

  const CommunityListItem({
    super.key,
    required this.title,
    required this.tags,
    required this.content,
    required this.time,
    required this.likeCount,
    required this.commentCount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text content section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tags
                Row(
                  children: tags
                      .map((tag) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color:
                                    context.palette.secondary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: OrbText(
                                tag,
                                type: OrbTextType.bodySmall,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 8),
                // Title
                OrbText(
                  title,
                  fontWeight: OrbFontWeight.medium,
                ),
                const SizedBox(height: 8),
                // Content
                OrbText(
                  content,
                ),
                const SizedBox(height: 8),
                // Time, like count, and comment count
                Row(
                  children: [
                    OrbText(
                      time,
                      type: OrbTextType.bodySmall,
                    ),
                    const SizedBox(width: 16),
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
          const SizedBox(width: 16),
          // Image section
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
