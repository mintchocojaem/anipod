import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class VolunteerDetailScreen extends StatelessWidget {
  const VolunteerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carouselItems = [
      'https://picsum.photos/1024/1024',
      'https://picsum.photos/1024/1024',
      'https://picsum.photos/1024/1024',
      'https://picsum.photos/1024/1024',
    ];
    return OrbScaffold(
      padding: EdgeInsets.zero,
      appBar: OrbAppBar(),
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
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width - 16),
              decoration: BoxDecoration(
                color: context.palette.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrbText(
                          '봉사활동 제목',
                          fontWeight: OrbFontWeight.medium,
                        ),
                        const SizedBox(height: 8),
                        OrbText(
                          '봉사활동 단체',
                          type: OrbTextType.bodySmall,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            OrbIcon(
                              Icons.location_on_rounded,
                              color: context.palette.primary,
                            ),
                            const SizedBox(width: 8),
                            OrbText(
                              '서울시 강남구',
                              type: OrbTextType.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            OrbIcon(
                              Icons.calendar_today_rounded,
                              color: context.palette.primary,
                            ),
                            const SizedBox(width: 8),
                            OrbText(
                              '2021.08.01 ~ 2021.08.31',
                              type: OrbTextType.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            OrbIcon(
                              Icons.access_time_rounded,
                              color: context.palette.primary,
                            ),
                            const SizedBox(width: 8),
                            OrbText(
                              '1일 8시간',
                              type: OrbTextType.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        OrbFilledButton(
                          text: '신청하기',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrbText(
                          '봉사활동 안내',
                        ),
                        const SizedBox(height: 16),
                        OrbText(
                          '봉사활동 안내 내용',
                          type: OrbTextType.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
