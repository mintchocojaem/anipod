import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class CrewEditScreen extends StatelessWidget {
  const CrewEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      backgroundColor: context.palette.surfaceBright,
      appBar: OrbAppBar(
        title: '크루 편집',
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        padding: const EdgeInsets.only(top: 24),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: context.palette.background,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: context.palette.surfaceBright,
                      child: OrbIcon(
                        Icons.person,
                        color: context.palette.surface,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    OrbText(
                                      '김철수',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      type: OrbTextType.bodyLarge,
                                      fontWeight: OrbFontWeight.medium,
                                    ),
                                    OrbText(
                                      ' (여 / 20)',
                                      type: OrbTextType.bodySmall,
                                      fontWeight: OrbFontWeight.medium,
                                      color: context.palette.surfaceDim,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: context.palette.secondary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: OrbText(
                                  '임금완료',
                                  color: context.palette.primary,
                                  fontWeight: OrbFontWeight.medium,
                                  type: OrbTextType.bodySmall,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                                child: OrbText(
                                  '지역',
                                  color: context.palette.surface,
                                  fontWeight: OrbFontWeight.medium,
                                  type: OrbTextType.bodySmall,
                                ),
                              ),
                              OrbText(
                                '서울시 강남구',
                                color: context.palette.surfaceDim,
                                fontWeight: OrbFontWeight.medium,
                                type: OrbTextType.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                                child: OrbText(
                                  '신청일',
                                  color: context.palette.surface,
                                  fontWeight: OrbFontWeight.medium,
                                  type: OrbTextType.bodySmall,
                                ),
                              ),
                              OrbText(
                                '2021.09.01',
                                color: context.palette.surfaceDim,
                                fontWeight: OrbFontWeight.medium,
                                type: OrbTextType.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OrbFilledButton(
                        text: '거절하기',
                        buttonTextType: OrbButtonTextType.medium,
                        backgroundColor: context.palette.secondary,
                        foregroundColor: context.palette.primary,
                        buttonSize: OrbButtonSize.fit,
                        buttonRadius: OrbButtonRadius.small,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OrbFilledButton(
                        text: '승인하기',
                        buttonTextType: OrbButtonTextType.medium,
                        buttonSize: OrbButtonSize.fit,
                        buttonRadius: OrbButtonRadius.small,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
