import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../orb.dart';

class OrbCategoryBar extends StatefulWidget {
  final int currentIndex;
  final List<String> categoryList;
  final void Function(int index) onIndexChanged;

  const OrbCategoryBar({
    super.key,
    required this.currentIndex,
    required this.categoryList,
    required this.onIndexChanged,
  });

  @override
  State<OrbCategoryBar> createState() => _OrbCategoryBarState();
}

class _OrbCategoryBarState extends State<OrbCategoryBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    selectedIndex = widget.currentIndex;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          for (int i = 0; i < widget.categoryList.length; i++)
            InkWell(
              onTap: () {
                if (selectedIndex != i) {
                  setState(() {
                    widget.onIndexChanged(i);
                    selectedIndex = i;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selectedIndex == i
                      ? context.palette.primary
                      : context.palette.surfaceBright,
                ),
                child: OrbText(
                  widget.categoryList[i],
                  type: OrbTextType.bodyMedium,
                  color: selectedIndex == i
                      ? context.palette.onPrimary
                      : context.palette.surface,
                ),
              ),
            ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
