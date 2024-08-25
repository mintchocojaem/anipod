import 'package:anipod/src/core/services/router/router_service.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../design_system/orb/orb.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: [
        HomeRoute(),
        HomeRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return OrbScaffold(
          body: child,
          bottomNavigationBar: OrbBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onIndexChanged: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              OrbBottomNavigationBarItem(
                label: 'home',
                icon: OrbIcon(Icons.home),
              ),
              OrbBottomNavigationBarItem(
                label: 'board',
                icon: OrbIcon(
                  Icons.table_chart_rounded,
                ),
              ),
              OrbBottomNavigationBarItem(
                label: 'profile',
                icon: OrbIcon(Icons.person),
              ),
            ],
          ),
        );
      },
    );
  }
}
