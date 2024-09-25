import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class SignUpCompleteScreen extends StatelessWidget {
  const SignUpCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      body: Column(
        children: [
          Flexible(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 64,
                    color: context.palette.primary,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const OrbText(
                    "회원가입을 축하드립니다!",
                    type: OrbTextType.titleMedium,
                    fontWeight: OrbFontWeight.medium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  OrbText(
                    "애니팟을 통해 유기견, 동네 크루, 봉사 정보 등\n다양한 정보를 공유해보세요.",
                    color: context.palette.surface,
                    textAlign: TextAlign.center,
                    fontWeight: OrbFontWeight.medium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer(
            builder: (context, ref, _) {
              return OrbFilledButton(
                onPressed: () {
                  ref.read(routerServiceProvider).replace(const LoginRoute());
                },
                text: "애니팟 시작하기",
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
