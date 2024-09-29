import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class CrewProfileItem extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final VoidCallback? onTap;

  const CrewProfileItem({
    super.key,
    this.imageUrl,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            // Circle image part
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.palette.surfaceBright,
                image: imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(imageUrl!),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {
                          print('Image Loading Error: $exception');
                        },
                      )
                    : null,
              ),
              child: imageUrl == null
                  ? Center(
                      child: OrbIcon(
                        Icons.people,
                        color: context.palette.surface,
                        size: OrbIconSize.medium,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 8),
            // Title text
            OrbText(
              title,
              type: OrbTextType.bodySmall,
              fontWeight: OrbFontWeight.medium,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
