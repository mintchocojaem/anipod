import 'package:anipod/src/core/services/router/router_service.gr.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../design_system/orb/orb.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      physics: const NeverScrollableScrollPhysics(),
      routes: [
        HomeRoute(),
        VolunteerRoute(),
        CommunityRoute(),
        UserProfileRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: OrbBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onIndexChanged: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              OrbBottomNavigationBarItem(
                label: 'home',
                icon: OrbIcon(
                  Icons.home,
                  color: tabsRouter.activeIndex == 0
                      ? context.palette.primary
                      : context.palette.surface,
                ),
              ),
              OrbBottomNavigationBarItem(
                label: 'board',
                icon: OrbIcon(
                  Icons.table_chart_rounded,
                  color: tabsRouter.activeIndex == 1
                      ? context.palette.primary
                      : context.palette.surface,
                ),
              ),
              OrbBottomNavigationBarItem(
                label: 'board',
                icon: OrbIcon(
                  Icons.comment,
                  color: tabsRouter.activeIndex == 2
                      ? context.palette.primary
                      : context.palette.surface,
                ),
              ),
              OrbBottomNavigationBarItem(
                label: 'profile',
                icon: OrbIcon(
                  Icons.person,
                  color: tabsRouter.activeIndex == 3
                      ? context.palette.primary
                      : context.palette.surface,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
