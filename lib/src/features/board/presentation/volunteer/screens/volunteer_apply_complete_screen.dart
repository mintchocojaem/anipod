import 'package:anipod/src/core/services/router/router_service.gr.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';

@RoutePage()
class VolunteerApplyCompleteScreen extends StatelessWidget {
  const VolunteerApplyCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      body: Consumer(builder: (context, ref, child) {
        return Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 100,
                      color: context.palette.primary,
                    ),
                    const SizedBox(height: 16),
                    OrbText(
                      '신청이 완료되었습니다',
                      type: OrbTextType.titleMedium,
                      fontWeight: OrbFontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    OrbText(
                      '봉사활동 결과는 마이페이지에서\n확인하실 수 있어요!',
                      type: OrbTextType.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                OrbFilledButton(
                  text: '신청내역 보기',
                  onPressed: () {
                    ref.read(routerServiceProvider).back();
                  },
                ),
                OrbTextButton(
                  text: '홈으로 돌아가기',
                  onPressed: () {
                    ref.read(routerServiceProvider).navigate(VolunteerRoute());
                  },
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
