import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../orb.dart';

//todo location participants 범용적으로 컴포넌트화

class OrbInfoItem {
  Widget icon;
  String text;

  OrbInfoItem({
    required this.icon,
    required this.text,
  });
}

class OrbInfoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final List<OrbInfoItem> infoItems;

  const OrbInfoCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.infoItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 36,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrbText(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              type: OrbTextType.bodyLarge,
            ),
            OrbText(
              description,
              color: context.palette.surfaceDim,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                ...infoItems.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        item.icon,
                        const SizedBox(width: 4),
                        OrbText(
                          item.text,
                          color: context.palette.surface,
                          type: OrbTextType.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
