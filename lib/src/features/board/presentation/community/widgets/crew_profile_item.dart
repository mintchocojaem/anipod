import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class CrewProfileItem extends StatelessWidget {
  final String path;
  final bool isAsset;
  final String title;

  const CrewProfileItem({
    super.key,
    this.isAsset = false,
    required this.path,
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
            child: isAsset
                ? Image.asset(
                    path,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    path,
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
