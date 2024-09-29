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
  final String? imageUrl;
  final IconData fallbackIcon;
  final String title;
  final String description;
  final List<OrbInfoItem> infoItems;

  const OrbInfoCard({
    super.key,
    this.imageUrl,
    required this.fallbackIcon,
    required this.title,
    required this.description,
    required this.infoItems,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            color: palette.surfaceBright,
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
                    fallbackIcon,
                    color: palette.surface,
                    size: OrbIconSize.medium,
                  ),
                )
              : null,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrbText(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                type: OrbTextType.bodyLarge,
                fontWeight: OrbFontWeight.medium,
              ),
              OrbText(
                description,
                color: palette.surfaceDim,
                maxLines: 2,
                type: OrbTextType.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...infoItems.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(right: 16),
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
