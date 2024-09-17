import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class UserActivityItem {
  final String title;
  final String content;
  final VoidCallback? onTap;

  UserActivityItem({
    required this.title,
    required this.content,
    this.onTap,
  });
}

class UserActivityCard extends StatelessWidget {
  final List<UserActivityItem> items;

  const UserActivityCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.palette.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: List.generate(items.length, (index) {
            return Expanded(
              child: InkWell(
                onTap: items[index].onTap,
                child: Container(
                  decoration: index == items.length - 1
                      ? const BoxDecoration()
                      : BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: context.palette.surface,
                            ),
                          ),
                        ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OrbText(
                        items[index].title,
                        type: OrbTextType.bodyLarge,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const SizedBox(height: 8),
                      OrbText(
                        items[index].content,
                        type: OrbTextType.bodyLarge,
                        fontWeight: OrbFontWeight.medium,
                        color: context.palette.primary,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
