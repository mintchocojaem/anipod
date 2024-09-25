import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class HomeCommunityCard extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final int likes;
  final int comments;

  const HomeCommunityCard({
    super.key,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: context.palette.surfaceBright,
                backgroundImage: NetworkImage(imageUrl),
                radius: 16,
              ),
              SizedBox(width: 8),
              Expanded(
                child: OrbText(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: OrbFontWeight.medium,
                  type: OrbTextType.bodyLarge,
                ),
              ),
              SizedBox(
                width: 52,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    OrbIcon(
                      Icons.favorite_rounded,
                      color: context.palette.error,
                      size: OrbIconSize.small,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: OrbText(
                        '$likes',
                        color: context.palette.surface,
                        type: OrbTextType.bodySmall,
                        fontWeight: OrbFontWeight.medium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
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
      ),
    );
  }
}
