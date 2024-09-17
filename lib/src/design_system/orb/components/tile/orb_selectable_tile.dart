import 'package:flutter/material.dart';

import '../../orb.dart';

class OrbSelectableTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final Function onTap;

  const OrbSelectableTile({
    super.key,
    required this.title,
    required this.description,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          color: palette.onPrimary,
          border: Border.all(
            color:
                isSelected ? palette.primary : palette.primary.withOpacity(0.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 4.0,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrbText(
                  title,
                  type: OrbTextType.bodyLarge,
                  fontWeight: OrbFontWeight.medium,
                ),
                OrbText(
                  description,
                ),
              ],
            ),
            OrbIcon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? palette.primary : palette.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
