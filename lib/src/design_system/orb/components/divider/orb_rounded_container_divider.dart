import 'package:flutter/material.dart';

import '../../orb.dart';

class OrbRoundedContainerDivider extends StatelessWidget {
  final double dividerSpace;
  final double dividerHeight;
  final double borderRadius;

  const OrbRoundedContainerDivider({
    super.key,
    this.dividerSpace = 32,
    this.dividerHeight = 56,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: dividerHeight,
          color: palette.surfaceBright,
        ),
        Positioned.fill(
          top: 0,
          bottom: dividerSpace,
          child: Container(
            decoration: BoxDecoration(
              color: palette.background,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(borderRadius),
                bottomLeft: Radius.circular(borderRadius),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: dividerSpace,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: palette.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
