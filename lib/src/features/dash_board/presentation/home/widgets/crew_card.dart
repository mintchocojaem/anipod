import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class CrewCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String location;
  final int participants;

  const CrewCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.location,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
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
                fontWeight: OrbFontWeight.medium,
              ),
              const SizedBox(
                height: 4,
              ),
              OrbText(
                description,
                color: context.palette.surface,
                fontWeight: OrbFontWeight.medium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  OrbIcon(
                    Icons.location_on,
                    size: OrbIconSize.small,
                  ),
                  SizedBox(width: 4),
                  OrbText(
                    location,
                    color: context.palette.surface,
                    type: OrbTextType.bodySmall,
                    fontWeight: OrbFontWeight.medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  OrbIcon(
                    Icons.person,
                    size: OrbIconSize.small,
                  ),
                  SizedBox(width: 4),
                  OrbText(
                    '$participants명',
                    color: context.palette.surface,
                    type: OrbTextType.bodySmall,
                    fontWeight: OrbFontWeight.medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
