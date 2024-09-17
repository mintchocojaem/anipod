import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class UserBackingScreen extends StatelessWidget {
  const UserBackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      backgroundColor: context.palette.surfaceBright,
      padding: EdgeInsets.zero,
      appBar: OrbAppBar(
        title: '후원',
        backgroundColor: context.palette.surfaceBright,
      ),
      body: ListView.builder(
        itemCount: 2,
        padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: context.palette.background,
              borderRadius: BorderRadius.circular(24),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: context.palette.surfaceBright,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrbText(
                            "후원 제목",
                            type: OrbTextType.bodyLarge,
                            fontWeight: OrbFontWeight.medium,
                          ),
                          const SizedBox(height: 4),
                          OrbText(
                            "서울 유기견 보호센터",
                            type: OrbTextType.bodyMedium,
                            color: context.palette.surfaceDim,
                          ),
                          const SizedBox(height: 4),
                          OrbText(
                            "2021.09.01 ~ 2021.09.30",
                            type: OrbTextType.bodySmall,
                            color: context.palette.surfaceDim,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const OrbDivider(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    OrbText(
                      "총 모금액",
                      type: OrbTextType.bodyLarge,
                      color: context.palette.surfaceDim,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    const Spacer(),
                    OrbText(
                      "900,000원",
                      type: OrbTextType.bodyLarge,
                      fontWeight: OrbFontWeight.medium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    OrbText(
                      "후원금액",
                      type: OrbTextType.bodyLarge,
                      color: context.palette.surfaceDim,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    const Spacer(),
                    OrbText(
                      "100,000원",
                      type: OrbTextType.bodyLarge,
                      fontWeight: OrbFontWeight.medium,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: context.palette.background,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, -4),
                blurRadius: 4,
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: OrbFilledButton(
            text: '후원하기',
            buttonSize: OrbButtonSize.compact,
            onPressed: () {
              // 가입하기 버튼 동작
            },
          ),
        ),
      ),
    );
  }
}
