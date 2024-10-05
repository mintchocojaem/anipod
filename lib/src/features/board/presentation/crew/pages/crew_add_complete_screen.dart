import 'package:anipod/src/core/services/router/router_service.gr.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class CrewAddCompleteScreen extends StatelessWidget {
  const CrewAddCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      body: Column(
        children: [
          Flexible(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 100,
                    color: context.palette.primary,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OrbText(
                    "크루가 생성되었습니다!",
                    type: OrbTextType.titleSmall,
                    fontWeight: OrbFontWeight.medium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  OrbText(
                    "애니팟과 함꼐 봉사활동을\n간편하게 시작해보아요!",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer(builder: (context, ref, _) {
            return OrbFilledButton(
              onPressed: () {
                ref.read(routerServiceProvider).navigate(CommunityRoute());
              },
              text: "홈으로 돌아가기",
            );
          }),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
