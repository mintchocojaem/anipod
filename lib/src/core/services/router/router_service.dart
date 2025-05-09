import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/auth/presentation/login/providers/login_token_provider.dart';
import 'router_service.gr.dart';

part 'router_service.g.dart';

@Riverpod(keepAlive: true)
RouterService routerService(RouterServiceRef ref) => RouterService(ref);

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class RouterService extends RootStackRouter {
  RouterService(this.ref);

  final Ref ref;

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
        AutoRoute(
          //initial: true,
          page: MainRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: VolunteerRoute.page,
            ),
            AutoRoute(
              page: CommunityRoute.page,
            ),
            AutoRoute(
              page: UserProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: VolunteerDetailRoute.page,
        ),
        AutoRoute(
          page: VolunteerApplyRoute.page,
        ),
        AutoRoute(
          page: VolunteerApplyCompleteRoute.page,
        ),
        AutoRoute(
          page: CrewFindRoute.page,
        ),
        AutoRoute(
          page: CrewAddRoute.page,
        ),
        AutoRoute(
          page: CrewAddCompleteRoute.page,
        ),
        AutoRoute(
          page: CrewDetailRoute.page,
        ),
        AutoRoute(
          page: CrewWaitListRoute.page,
        ),
        AutoRoute(
          page: CommunityPostDetailRoute.page,
        ),
        AutoRoute(
          page: CommunityPostAddRoute.page,
        ),
        AutoRoute(
          page: UserRankRoute.page,
        ),
        AutoRoute(
          page: UserProfileEditRoute.page,
        ),
        AutoRoute(
          page: NoticeRoute.page,
        ),
        AutoRoute(
          page: UserVolunteerRoute.page,
        ),
        AutoRoute(
          page: UserVolunteerDetailRoute.page,
        ),
        AutoRoute(
          page: NotificationRoute.page,
        ),
        AutoRoute(
          page: UserBackingRoute.page,
        ),
        AutoRoute(
          page: BackingRoute.page,
        ),
        AutoRoute(
          page: BackingDetailRoute.page,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        AutoRouteGuard.simple(
          (resolver, router) {
            final loginToken = ref.read(loginTokenProvider);
            final isAuthenticated = loginToken.hasValue;
            if (isAuthenticated || resolver.routeName == LoginRoute.name) {
              // we continue navigation
              resolver.next();
            } else {
              // else we navigate to the Login page so we get authenticated

              // tip: use resolver.redirect to have the redirected route
              // automatically removed from the stack when the resolver is completed
              resolver.redirect(const LoginRoute());
            }
          },
        ),
        // optionally add root guards here
      ];
}
