import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../orb.dart';

class OrbAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final Widget? trailing;
  final bool centerTitle;
  final Color? backgroundColor;
  final bool isLoading;
  final Color? titleColor;
  final double elevation;
  final double opacity;

  final Function()? onAutoImplyLeadingPressed;

  const OrbAppBar({
    super.key,
    this.title = "",
    this.leading,
    this.trailing,
    this.centerTitle = false,
    this.isLoading = false,
    this.backgroundColor,
    this.titleColor,
    this.onAutoImplyLeadingPressed,
    this.elevation = 0,
    this.opacity = 1,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;
    return Opacity(
      opacity: opacity,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor ?? palette.background,
        elevation: elevation,
        scrolledUnderElevation: 0,
        leading: leading ??
            (Navigator.of(context).canPop()
                ? IconButton(
                    padding: const EdgeInsets.only(left: 8),
                    icon: OrbIcon(
                      Icons.arrow_back_ios,
                      color: palette.surface,
                    ),
                    onPressed: onAutoImplyLeadingPressed ??
                        () {
                          Navigator.of(context).pop();
                        },
                  )
                : null),
        centerTitle: centerTitle,
        title: OrbText(
          title,
          type: OrbTextType.titleSmall,
          fontWeight: OrbFontWeight.medium,
          color: titleColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: trailing ?? const SizedBox(),
          ),
        ],
        bottom: isLoading
            ? PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: Shimmer.fromColors(
                  baseColor: palette.onPrimary,
                  highlightColor: palette.primary,
                  child: LinearProgressIndicator(
                    minHeight: 2,
                    value: 1,
                    color: palette.primary,
                  ),
                ),
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
