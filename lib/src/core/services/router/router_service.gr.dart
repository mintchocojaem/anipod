// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anipod/src/core/services/router/main_screen.dart' as _i17;
import 'package:anipod/src/features/auth/presentation/find/screens/find_id_complete_screen.dart'
    as _i11;
import 'package:anipod/src/features/auth/presentation/find/screens/find_id_screen.dart'
    as _i12;
import 'package:anipod/src/features/auth/presentation/find/screens/find_password_complete_screen.dart'
    as _i13;
import 'package:anipod/src/features/auth/presentation/find/screens/find_password_screen.dart'
    as _i14;
import 'package:anipod/src/features/auth/presentation/login/screens/login_screen.dart'
    as _i16;
import 'package:anipod/src/features/auth/presentation/sign_up/screens/sign_up_complete_screen.dart'
    as _i20;
import 'package:anipod/src/features/auth/presentation/sign_up/screens/sign_up_screen.dart'
    as _i21;
import 'package:anipod/src/features/board/presentation/backing/pages/backing_detail_screen.dart'
    as _i1;
import 'package:anipod/src/features/board/presentation/backing/pages/backing_screen.dart'
    as _i2;
import 'package:anipod/src/features/board/presentation/community/pages/community_post_add_screen.dart'
    as _i3;
import 'package:anipod/src/features/board/presentation/community/pages/community_post_detail_screen.dart'
    as _i4;
import 'package:anipod/src/features/board/presentation/community/pages/community_screen.dart'
    as _i5;
import 'package:anipod/src/features/board/presentation/crew/pages/crew_add_complete_screen.dart'
    as _i6;
import 'package:anipod/src/features/board/presentation/crew/pages/crew_add_screen.dart'
    as _i7;
import 'package:anipod/src/features/board/presentation/crew/pages/crew_detail_screen.dart'
    as _i8;
import 'package:anipod/src/features/board/presentation/crew/pages/crew_find_screen.dart'
    as _i9;
import 'package:anipod/src/features/board/presentation/crew/pages/crew_wait_list_screen.dart'
    as _i10;
import 'package:anipod/src/features/board/presentation/volunteer/screens/volunteer_apply_complete_screen.dart'
    as _i28;
import 'package:anipod/src/features/board/presentation/volunteer/screens/volunteer_apply_screen.dart'
    as _i29;
import 'package:anipod/src/features/board/presentation/volunteer/screens/volunteer_detail_screen.dart'
    as _i30;
import 'package:anipod/src/features/board/presentation/volunteer/screens/volunteer_screen.dart'
    as _i31;
import 'package:anipod/src/features/dash_board/presentation/home/screens/home_screen.dart'
    as _i15;
import 'package:anipod/src/features/user/presentation/user_profile/screens/notice_screen.dart'
    as _i18;
import 'package:anipod/src/features/user/presentation/user_profile/screens/notification_screen.dart'
    as _i19;
import 'package:anipod/src/features/user/presentation/user_profile/screens/user_backing_screen.dart'
    as _i22;
import 'package:anipod/src/features/user/presentation/user_profile/screens/user_profile_edit_screen.dart'
    as _i23;
import 'package:anipod/src/features/user/presentation/user_profile/screens/user_profile_screen.dart'
    as _i24;
import 'package:anipod/src/features/user/presentation/user_profile/screens/user_rank_screen.dart'
    as _i25;
import 'package:anipod/src/features/user/presentation/user_profile/screens/user_volunteer_detail_screen.dart'
    as _i26;
import 'package:anipod/src/features/user/presentation/user_profile/screens/user_volunteer_screen.dart'
    as _i27;
import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/material.dart' as _i33;

/// generated route for
/// [_i1.BackingDetailScreen]
class BackingDetailRoute extends _i32.PageRouteInfo<void> {
  const BackingDetailRoute({List<_i32.PageRouteInfo>? children})
      : super(
          BackingDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'BackingDetailRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i1.BackingDetailScreen();
    },
  );
}

/// generated route for
/// [_i2.BackingScreen]
class BackingRoute extends _i32.PageRouteInfo<void> {
  const BackingRoute({List<_i32.PageRouteInfo>? children})
      : super(
          BackingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BackingRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i2.BackingScreen();
    },
  );
}

/// generated route for
/// [_i3.CommunityPostAddScreen]
class CommunityPostAddRoute extends _i32.PageRouteInfo<void> {
  const CommunityPostAddRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CommunityPostAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityPostAddRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i3.CommunityPostAddScreen();
    },
  );
}

/// generated route for
/// [_i4.CommunityPostDetailScreen]
class CommunityPostDetailRoute
    extends _i32.PageRouteInfo<CommunityPostDetailRouteArgs> {
  CommunityPostDetailRoute({
    _i33.Key? key,
    required String postId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          CommunityPostDetailRoute.name,
          args: CommunityPostDetailRouteArgs(
            key: key,
            postId: postId,
          ),
          initialChildren: children,
        );

  static const String name = 'CommunityPostDetailRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommunityPostDetailRouteArgs>();
      return _i4.CommunityPostDetailScreen(
        key: args.key,
        postId: args.postId,
      );
    },
  );
}

class CommunityPostDetailRouteArgs {
  const CommunityPostDetailRouteArgs({
    this.key,
    required this.postId,
  });

  final _i33.Key? key;

  final String postId;

  @override
  String toString() {
    return 'CommunityPostDetailRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [_i5.CommunityScreen]
class CommunityRoute extends _i32.PageRouteInfo<void> {
  const CommunityRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CommunityRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i5.CommunityScreen();
    },
  );
}

/// generated route for
/// [_i6.CrewAddCompleteScreen]
class CrewAddCompleteRoute extends _i32.PageRouteInfo<void> {
  const CrewAddCompleteRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CrewAddCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CrewAddCompleteRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i6.CrewAddCompleteScreen();
    },
  );
}

/// generated route for
/// [_i7.CrewAddScreen]
class CrewAddRoute extends _i32.PageRouteInfo<void> {
  const CrewAddRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CrewAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'CrewAddRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i7.CrewAddScreen();
    },
  );
}

/// generated route for
/// [_i8.CrewDetailScreen]
class CrewDetailRoute extends _i32.PageRouteInfo<CrewDetailRouteArgs> {
  CrewDetailRoute({
    _i33.Key? key,
    required String crewId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          CrewDetailRoute.name,
          args: CrewDetailRouteArgs(
            key: key,
            crewId: crewId,
          ),
          initialChildren: children,
        );

  static const String name = 'CrewDetailRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CrewDetailRouteArgs>();
      return _i8.CrewDetailScreen(
        key: args.key,
        crewId: args.crewId,
      );
    },
  );
}

class CrewDetailRouteArgs {
  const CrewDetailRouteArgs({
    this.key,
    required this.crewId,
  });

  final _i33.Key? key;

  final String crewId;

  @override
  String toString() {
    return 'CrewDetailRouteArgs{key: $key, crewId: $crewId}';
  }
}

/// generated route for
/// [_i9.CrewFindScreen]
class CrewFindRoute extends _i32.PageRouteInfo<void> {
  const CrewFindRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CrewFindRoute.name,
          initialChildren: children,
        );

  static const String name = 'CrewFindRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i9.CrewFindScreen();
    },
  );
}

/// generated route for
/// [_i10.CrewWaitListScreen]
class CrewWaitListRoute extends _i32.PageRouteInfo<CrewWaitListRouteArgs> {
  CrewWaitListRoute({
    _i33.Key? key,
    required String crewId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          CrewWaitListRoute.name,
          args: CrewWaitListRouteArgs(
            key: key,
            crewId: crewId,
          ),
          initialChildren: children,
        );

  static const String name = 'CrewWaitListRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CrewWaitListRouteArgs>();
      return _i10.CrewWaitListScreen(
        key: args.key,
        crewId: args.crewId,
      );
    },
  );
}

class CrewWaitListRouteArgs {
  const CrewWaitListRouteArgs({
    this.key,
    required this.crewId,
  });

  final _i33.Key? key;

  final String crewId;

  @override
  String toString() {
    return 'CrewWaitListRouteArgs{key: $key, crewId: $crewId}';
  }
}

/// generated route for
/// [_i11.FindIdCompleteScreen]
class FindIdCompleteRoute extends _i32.PageRouteInfo<void> {
  const FindIdCompleteRoute({List<_i32.PageRouteInfo>? children})
      : super(
          FindIdCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindIdCompleteRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i11.FindIdCompleteScreen();
    },
  );
}

/// generated route for
/// [_i12.FindIdScreen]
class FindIdRoute extends _i32.PageRouteInfo<void> {
  const FindIdRoute({List<_i32.PageRouteInfo>? children})
      : super(
          FindIdRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindIdRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i12.FindIdScreen();
    },
  );
}

/// generated route for
/// [_i13.FindPasswordCompleteScreen]
class FindPasswordCompleteRoute extends _i32.PageRouteInfo<void> {
  const FindPasswordCompleteRoute({List<_i32.PageRouteInfo>? children})
      : super(
          FindPasswordCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindPasswordCompleteRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i13.FindPasswordCompleteScreen();
    },
  );
}

/// generated route for
/// [_i14.FindPasswordScreen]
class FindPasswordRoute extends _i32.PageRouteInfo<void> {
  const FindPasswordRoute({List<_i32.PageRouteInfo>? children})
      : super(
          FindPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindPasswordRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i14.FindPasswordScreen();
    },
  );
}

/// generated route for
/// [_i15.HomeScreen]
class HomeRoute extends _i32.PageRouteInfo<void> {
  const HomeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i15.HomeScreen();
    },
  );
}

/// generated route for
/// [_i16.LoginScreen]
class LoginRoute extends _i32.PageRouteInfo<void> {
  const LoginRoute({List<_i32.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i16.LoginScreen();
    },
  );
}

/// generated route for
/// [_i17.MainScreen]
class MainRoute extends _i32.PageRouteInfo<void> {
  const MainRoute({List<_i32.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i17.MainScreen();
    },
  );
}

/// generated route for
/// [_i18.NoticeScreen]
class NoticeRoute extends _i32.PageRouteInfo<void> {
  const NoticeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NoticeRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoticeRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i18.NoticeScreen();
    },
  );
}

/// generated route for
/// [_i19.NotificationScreen]
class NotificationRoute extends _i32.PageRouteInfo<void> {
  const NotificationRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i19.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i20.SignUpCompleteScreen]
class SignUpCompleteRoute extends _i32.PageRouteInfo<void> {
  const SignUpCompleteRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SignUpCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpCompleteRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i20.SignUpCompleteScreen();
    },
  );
}

/// generated route for
/// [_i21.SignUpScreen]
class SignUpRoute extends _i32.PageRouteInfo<void> {
  const SignUpRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i21.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i22.UserBackingScreen]
class UserBackingRoute extends _i32.PageRouteInfo<void> {
  const UserBackingRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UserBackingRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserBackingRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i22.UserBackingScreen();
    },
  );
}

/// generated route for
/// [_i23.UserProfileEditScreen]
class UserProfileEditRoute extends _i32.PageRouteInfo<void> {
  const UserProfileEditRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UserProfileEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileEditRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i23.UserProfileEditScreen();
    },
  );
}

/// generated route for
/// [_i24.UserProfileScreen]
class UserProfileRoute extends _i32.PageRouteInfo<void> {
  const UserProfileRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i24.UserProfileScreen();
    },
  );
}

/// generated route for
/// [_i25.UserRankScreen]
class UserRankRoute extends _i32.PageRouteInfo<void> {
  const UserRankRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UserRankRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRankRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i25.UserRankScreen();
    },
  );
}

/// generated route for
/// [_i26.UserVolunteerDetailScreen]
class UserVolunteerDetailRoute extends _i32.PageRouteInfo<void> {
  const UserVolunteerDetailRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UserVolunteerDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserVolunteerDetailRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i26.UserVolunteerDetailScreen();
    },
  );
}

/// generated route for
/// [_i27.UserVolunteerScreen]
class UserVolunteerRoute extends _i32.PageRouteInfo<void> {
  const UserVolunteerRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UserVolunteerRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserVolunteerRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i27.UserVolunteerScreen();
    },
  );
}

/// generated route for
/// [_i28.VolunteerApplyCompleteScreen]
class VolunteerApplyCompleteRoute extends _i32.PageRouteInfo<void> {
  const VolunteerApplyCompleteRoute({List<_i32.PageRouteInfo>? children})
      : super(
          VolunteerApplyCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'VolunteerApplyCompleteRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i28.VolunteerApplyCompleteScreen();
    },
  );
}

/// generated route for
/// [_i29.VolunteerApplyScreen]
class VolunteerApplyRoute extends _i32.PageRouteInfo<VolunteerApplyRouteArgs> {
  VolunteerApplyRoute({
    _i33.Key? key,
    required String postId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          VolunteerApplyRoute.name,
          args: VolunteerApplyRouteArgs(
            key: key,
            postId: postId,
          ),
          initialChildren: children,
        );

  static const String name = 'VolunteerApplyRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VolunteerApplyRouteArgs>();
      return _i29.VolunteerApplyScreen(
        key: args.key,
        postId: args.postId,
      );
    },
  );
}

class VolunteerApplyRouteArgs {
  const VolunteerApplyRouteArgs({
    this.key,
    required this.postId,
  });

  final _i33.Key? key;

  final String postId;

  @override
  String toString() {
    return 'VolunteerApplyRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [_i30.VolunteerDetailScreen]
class VolunteerDetailRoute
    extends _i32.PageRouteInfo<VolunteerDetailRouteArgs> {
  VolunteerDetailRoute({
    _i33.Key? key,
    required String postId,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          VolunteerDetailRoute.name,
          args: VolunteerDetailRouteArgs(
            key: key,
            postId: postId,
          ),
          initialChildren: children,
        );

  static const String name = 'VolunteerDetailRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VolunteerDetailRouteArgs>();
      return _i30.VolunteerDetailScreen(
        key: args.key,
        postId: args.postId,
      );
    },
  );
}

class VolunteerDetailRouteArgs {
  const VolunteerDetailRouteArgs({
    this.key,
    required this.postId,
  });

  final _i33.Key? key;

  final String postId;

  @override
  String toString() {
    return 'VolunteerDetailRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [_i31.VolunteerScreen]
class VolunteerRoute extends _i32.PageRouteInfo<void> {
  const VolunteerRoute({List<_i32.PageRouteInfo>? children})
      : super(
          VolunteerRoute.name,
          initialChildren: children,
        );

  static const String name = 'VolunteerRoute';

  static _i32.PageInfo page = _i32.PageInfo(
    name,
    builder: (data) {
      return const _i31.VolunteerScreen();
    },
  );
}
