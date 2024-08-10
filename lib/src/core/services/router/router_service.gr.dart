// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anipod/src/features/auth/presentation/login/login_screen.dart'
    as _i1;
import 'package:anipod/src/features/auth/presentation/sign_up/sign_up_complete_screen.dart'
    as _i2;
import 'package:anipod/src/features/auth/presentation/sign_up/sign_up_screen.dart'
    as _i3;
import 'package:auto_route/auto_route.dart' as _i4;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.SignUpCompleteScreen]
class SignUpCompleteRoute extends _i4.PageRouteInfo<void> {
  const SignUpCompleteRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SignUpCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpCompleteRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.SignUpCompleteScreen();
    },
  );
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpRoute extends _i4.PageRouteInfo<void> {
  const SignUpRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignUpScreen();
    },
  );
}
