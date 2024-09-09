import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:flutter/material.dart';

class GuideCard extends StatelessWidget {
  final String content;
  final Widget icon;

  const GuideCard({
    super.key,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.palette.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: OrbText(
              content,
              type: OrbTextType.bodyMedium,
              fontWeight: OrbFontWeight.medium,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: icon,
          ),
        ],
      ),
    );
  }
}
