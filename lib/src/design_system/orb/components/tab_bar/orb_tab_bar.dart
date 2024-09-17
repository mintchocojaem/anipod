import 'package:flutter/material.dart';

import '../../orb.dart';

class OrbTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final TabController? controller;
  final Function(int)? onTabChange;
  final TabAlignment tabAlignment;
  final bool isScrollable;
  final TabBarIndicatorSize indicatorSize;
  final double indicatorWeight;

  const OrbTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.onTabChange,
    this.tabAlignment = TabAlignment.start,
    this.isScrollable = false,
    this.indicatorSize = TabBarIndicatorSize.label,
    this.indicatorWeight = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;
    return DefaultTabController(
      length: tabs.length,
      child: TabBar(
        tabs: tabs,
        controller: controller,
        isScrollable: isScrollable,
        tabAlignment: tabAlignment,
        indicatorColor: palette.primary,
        indicatorSize: indicatorSize,
        indicatorWeight: indicatorWeight,
        labelColor: palette.primary,
        onTap: onTabChange,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
    );
  }
}
