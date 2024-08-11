import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'router_service.gr.dart';

part 'router_service.g.dart';

@riverpod
RouterService routerService(RouterServiceRef ref) => RouterService();

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class RouterService extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: SignUpCompleteRoute.page,
        ),
        AutoRoute(
          page: FindIdRoute.page,
        ),
        AutoRoute(
          page: FindIdCompleteRoute.page,
        ),
        AutoRoute(
          page: FindPasswordRoute.page,
        ),
        AutoRoute(
          page: FindPasswordCompleteRoute.page,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
