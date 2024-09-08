import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class CrewProfileItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CrewProfileItem({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          // Circle image part
          ClipOval(
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
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
    );
  }
}
