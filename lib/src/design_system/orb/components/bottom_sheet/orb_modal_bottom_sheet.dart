import 'package:flutter/material.dart';

import '../../orb.dart';

Future<void> showOrbModalBottomSheet(BuildContext context, Widget child) async {
  await OrbModalBottomSheet._show(context, child);
}

class OrbModalBottomSheet extends StatelessWidget {
  final Widget? child;
  final Widget? leading;
  final Widget? trailing;
  final double? height;
  final bool showDragHandle;
  final String? titleText;
  final bool centerTitle;

  const OrbModalBottomSheet({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.height,
    this.showDragHandle = true,
    this.titleText,
    this.centerTitle = false,
  });

  static Future<void> _show(BuildContext context, Widget child) async {
    final themeData = OrbThemeData.of(context);
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: themeData.palette.background,
      isScrollControlled: true,
      elevation: 0,
      builder: (_) {
        return child;
      },
    );
  }

  Future<void> show(BuildContext context) async {
    await _show(context, this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                leading != null
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: leading!,
                      )
                    : const SizedBox(),
                titleText != null
                    ? Align(
                        alignment: centerTitle || leading != null
                            ? Alignment.center
                            : Alignment.centerLeft,
                        child: OrbText(
                          titleText!,
                          type: OrbTextType.titleSmall,
                          fontWeight: OrbFontWeight.medium,
                        ),
                      )
                    : const SizedBox(),
                if (trailing != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: trailing!,
                  ),
              ],
            ),
            if (leading != null || titleText != null || trailing != null)
              const SizedBox(height: 16),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
