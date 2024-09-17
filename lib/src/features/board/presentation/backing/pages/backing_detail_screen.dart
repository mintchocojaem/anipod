import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class BackingDetailScreen extends StatelessWidget {
  const BackingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carouselItems = [
      'https://picsum.photos/1024/1024',
      'https://picsum.photos/1024/1024',
      'https://picsum.photos/1024/1024',
      'https://picsum.photos/1024/1024',
    ];
    return Consumer(builder: (context, ref, child) {
      return OrbScaffold(
        padding: EdgeInsets.zero,
        extendBodyBehindTitle: true,
        extendBodyBehindAppBar: true,
        appBar: const OrbAppBar(
          backgroundColor: Colors.transparent,
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
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: OrbIcon(
                    Icons.favorite_rounded,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OrbFilledButton(
                    text: '후원하기',
                    buttonSize: OrbButtonSize.compact,
                    onPressed: () {
                      // 가입하기 버튼 동작
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              OrbBanner(
                height: MediaQuery.of(context).size.width,
                urls: carouselItems,
                onTap: (index) {},
                onPageChanged: (index) {},
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width - 16),
                decoration: BoxDecoration(
                  color: context.palette.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrbText(
                            '동물구조119 유기동물들의\n질병예방을 도와주세요',
                            type: OrbTextType.titleSmall,
                            fontWeight: OrbFontWeight.medium,
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.palette.primary,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: OrbText(
                              'D-20',
                              type: OrbTextType.bodySmall,
                              color: context.palette.primary,
                              fontWeight: OrbFontWeight.medium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      OrbText(
                        '서울 유기견 보호센터',
                        type: OrbTextType.bodySmall,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const SizedBox(height: 24),
                      BackingDetailRow(
                        label: '모집인원',
                        value: '10명',
                      ),
                      BackingDetailRow(
                        label: '활동기간',
                        value: '2021.10.01 ~ 2021.10.31',
                      ),
                      const SizedBox(height: 4),
                      OrbText(
                        '모금 달성률',
                        color: context.palette.surfaceDim,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 8,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: context.palette.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.palette.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          OrbText(
                            '50% 달성',
                            color: context.palette.primary,
                            fontWeight: OrbFontWeight.medium,
                          ),
                          const Spacer(),
                          OrbText(
                            '100,000원 / 200,000원',
                            color: context.palette.surfaceDim,
                            fontWeight: OrbFontWeight.medium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      OrbDivider(),
                      const SizedBox(height: 24),
                      OrbText(
                        '후원자들의 후기',
                        type: OrbTextType.bodyLarge,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const SizedBox(height: 24),
                      OrbText(
                        '동물구조119에는 대형견, 중형견, 소형견등 구조되어 보호되고 있는 강아지들이 27여마리 그리고 구조되어 보호되고 있는 고양이들이 11마리내외 있습니다. 최대한 재정적으로 줄',
                        color: context.palette.surfaceDim,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const SizedBox(height: 24),
                      OrbDivider(),
                      const SizedBox(height: 24),
                      OrbText(
                        '모금 계획',
                        type: OrbTextType.bodyLarge,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: context.palette.secondary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: context.palette.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                OrbText(
                                  '100%',
                                  fontWeight: OrbFontWeight.medium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            OrbText(
                              '보호소 시설 구축과 유기동물 보호',
                              fontWeight: OrbFontWeight.medium,
                            ),
                            const SizedBox(height: 24),
                            Align(
                              alignment: Alignment.centerRight,
                              child: OrbText(
                                '총 100,000원',
                                type: OrbTextType.bodyLarge,
                                fontWeight: OrbFontWeight.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      OrbText(
                        '*모금액이 계획보다 부족할 경우 모금 규모를 축소하여 모인 금액만전달될 예정입니다.',
                        color: context.palette.surfaceDim,
                        type: OrbTextType.bodySmall,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const SizedBox(height: 24),
                      OrbDivider(),
                      const SizedBox(height: 24),
                      OrbText(
                        '소식',
                        type: OrbTextType.bodyLarge,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.palette.primary,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrbText(
                              '💌\n총 모금 계획의 70%를 달성했어요!',
                              fontWeight: OrbFontWeight.medium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class BackingDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const BackingDetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: OrbText(
              label,
              color: context.palette.surfaceDim,
              fontWeight: OrbFontWeight.medium,
            ),
          ),
          OrbText(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
