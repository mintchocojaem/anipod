import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../widgets/user_activity_card.dart';

@RoutePage()
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: context.palette.surfaceBright,
      appBar: OrbAppBar(
        title: '마이페이지',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                color: context.palette.background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
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
                  // Title text
                  OrbText(
                    '이름',
                    type: OrbTextType.bodyLarge,
                    fontWeight: OrbFontWeight.medium,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  OrbText(
                    'example@gmail.com',
                    type: OrbTextType.bodySmall,
                    fontWeight: OrbFontWeight.medium,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  UserActivityCard(
                    items: [
                      UserActivityItem(
                        title: '포인트',
                        content: '1000',
                      ),
                      UserActivityItem(
                        title: '쿠폰',
                        content: '3',
                      ),
                      UserActivityItem(
                        title: '쿠폰',
                        content: '3',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.palette.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrbText(
                      '앱 설정',
                      type: OrbTextType.titleMedium,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    OrbText(
                      '내정보',
                      type: OrbTextType.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbText(
                      '계정 관리',
                      type: OrbTextType.titleSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbText(
                      '봉사활동 현황',
                      type: OrbTextType.titleSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbText(
                      '등급',
                      type: OrbTextType.titleSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbText(
                      '내 동네 설정',
                      type: OrbTextType.titleSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbDivider(),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbText(
                      '앱 옵션',
                      type: OrbTextType.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbText(
                      '알림 설정',
                      type: OrbTextType.titleSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbDivider(),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbText(
                      '고객 지원',
                      type: OrbTextType.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbText(
                      '고객 센터',
                      type: OrbTextType.titleSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OrbText(
                      '공지사항',
                      type: OrbTextType.titleSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
