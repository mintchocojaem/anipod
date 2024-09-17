import 'package:flutter/material.dart';

import '../../orb.dart';

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
    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;
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
              color: palette.surfaceDim,
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
                          color: palette.surface,
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
