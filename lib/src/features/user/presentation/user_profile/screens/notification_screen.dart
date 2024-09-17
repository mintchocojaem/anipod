import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      backgroundColor: context.palette.surfaceBright,
      appBar: OrbAppBar(
        title: '알림설정',
        centerTitle: true,
        backgroundColor: context.palette.surfaceBright,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrbText(
            '애니팟의 다양한 소식을 알려드릴게요.\n알림을 꺼도 중요한 정보는 받을 수 있어요.',
            type: OrbTextType.bodySmall,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OrbText(
                            '알림',
                            type: OrbTextType.bodyLarge,
                            fontWeight: OrbFontWeight.medium,
                          ),
                        ),
                        OrbSwitch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OrbText(
                            '앱 알림',
                            type: OrbTextType.bodyLarge,
                            fontWeight: OrbFontWeight.medium,
                          ),
                        ),
                        OrbSwitch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
