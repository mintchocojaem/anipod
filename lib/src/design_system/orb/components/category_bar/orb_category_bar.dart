import 'package:flutter/material.dart';

import '../../orb.dart';

class OrbCategoryBar extends StatefulWidget {
  final int currentIndex;
  final List<String> categoryList;
  final void Function(int index) onIndexChanged;
  final double horizontalPadding;
  final Color? backgroundColor;
  final Color? selectedBackgroundColor;
  final Color? foregroundColor;
  final Color? selectedForegroundColor;

  const OrbCategoryBar({
    super.key,
    required this.currentIndex,
    required this.categoryList,
    required this.onIndexChanged,
    this.horizontalPadding = 24,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.foregroundColor,
    this.selectedForegroundColor,
  });

  @override
  State<OrbCategoryBar> createState() => _OrbCategoryBarState();
}

class _OrbCategoryBarState extends State<OrbCategoryBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;

    final backgroundColor = widget.backgroundColor ?? palette.surfaceBright;
    final selectedBackgroundColor =
        widget.selectedBackgroundColor ?? palette.primary;
    final foregroundColor = widget.foregroundColor ?? palette.surface;
    final selectedForegroundColor =
        widget.selectedForegroundColor ?? palette.onPrimary;

    selectedIndex = widget.currentIndex;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: widget.horizontalPadding),
          for (int i = 0; i < widget.categoryList.length; i++)
            GestureDetector(
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selectedIndex == i
                      ? selectedBackgroundColor
                      : backgroundColor,
                ),
                child: OrbText(
                  widget.categoryList[i],
                  fontWeight: OrbFontWeight.medium,
                  color: selectedIndex == i
                      ? selectedForegroundColor
                      : foregroundColor,
                ),
              ),
            ),
          SizedBox(width: widget.horizontalPadding),
        ],
      ),
    );
  }
}
