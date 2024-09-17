import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../widgets/user_activity_card.dart';

@RoutePage()
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return OrbScaffold(
          padding: EdgeInsets.zero,
          appBar: OrbAppBar(
            title: '마이페이지',
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileSection(context, ref),
                const OrbRoundedContainerDivider(),
                _buildSettingsSection(context, ref),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileSection(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: context.palette.background,
      ),
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              'https://picsum.photos/200',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          _buildProfileText('이름', OrbTextType.bodyLarge, context),
          const SizedBox(height: 4),
          _buildProfileText(
              'example@gmail.com', OrbTextType.bodySmall, context),
          const SizedBox(height: 16),
          UserActivityCard(
            items: [
              UserActivityItem(title: '봉사시간', content: '100시간'),
              UserActivityItem(title: '봉사횟수', content: '3'),
              UserActivityItem(
                  title: '후원',
                  content: '1회',
                  onTap: () {
                    ref.read(routerServiceProvider).push(UserBackingRoute());
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileText(
      String text, OrbTextType type, BuildContext context) {
    return OrbText(
      text,
      type: type,
      fontWeight: OrbFontWeight.medium,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSettingsSection(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.palette.background,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: OrbText(
                '설정',
                type: OrbTextType.titleSmall,
                fontWeight: OrbFontWeight.medium,
              ),
            ),
            _buildSettingTitle('내정보', context),
            _buildSettingItem('계정 관리', context,
                onTap: () => ref
                    .read(routerServiceProvider)
                    .push(UserProfileEditRoute())),
            _buildSettingItem('봉사활동 현황', context,
                onTap: () =>
                    ref.read(routerServiceProvider).push(UserVolunteerRoute())),
            _buildSettingItem(
              '등급',
              context,
              onTap: () =>
                  ref.read(routerServiceProvider).push(UserRankRoute()),
            ),
            _buildSettingItem('내 동네 설정', context),
            const OrbDivider(),
            _buildSettingTitle('앱 옵션', context),
            _buildSettingItem('알림 설정', context,
                onTap: () =>
                    ref.read(routerServiceProvider).push(NotificationRoute())),
            const OrbDivider(),
            _buildSettingTitle('고객 지원', context),
            //_buildSettingItem('고객 센터', context),
            _buildSettingItem('공지사항', context,
                onTap: () =>
                    ref.read(routerServiceProvider).push(NoticeRoute())),
            const OrbDivider(),
            _buildSettingTitle('기타', context),
            _buildSettingItem(
              '로그아웃',
              context,
              onTap: () => _showLogoutDialog(context),
            ),
            _buildSettingItem('탈퇴하기', context,
                onTap: () => showOrbModalBottomSheet(
                    context, _withdrawalBottomSheet(context))),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: OrbText(
        title,
        type: OrbTextType.bodyMedium,
        color: context.palette.surfaceDim,
      ),
    );
  }

  Widget _buildSettingItem(String title, BuildContext context,
      {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          child: OrbText(
            title,
            type: OrbTextType.bodyLarge,
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) {
    return OrbDialog(
      title: '로그아웃',
      content: OrbText('로그아웃 하시겠습니까?', type: OrbTextType.bodyMedium),
      leftButtonText: '취소',
      onLeftButtonPressed: () async => true,
      rightButtonText: '로그아웃',
      onRightButtonPressed: () async => true,
    ).show(context);
  }

  OrbModalBottomSheet _withdrawalBottomSheet(BuildContext context) {
    return OrbModalBottomSheet(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: OrbText(
                '잠깐만요',
                type: OrbTextType.titleSmall,
                fontWeight: OrbFontWeight.medium,
              ),
            ),
            OrbText(
              '탈퇴 시 계정 및 이용 기록은 모두 삭제되며,\n삭제된 데이터는 복구가 불가능합니다.\n또한 탈퇴 후 동일 계정으로 재가입 시\n제한을 받을 수 있습니다.\n탈퇴를 진행할까요?',
              type: OrbTextType.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            OrbFilledButton(
              text: '탈퇴하기',
              backgroundColor: context.palette.error,
              onPressed: () {},
            ),
            OrbTextButton(
              text: '취소',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
