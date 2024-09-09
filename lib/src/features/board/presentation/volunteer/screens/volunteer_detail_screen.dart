import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
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
    return Consumer(builder: (context, ref, child) {
      return OrbScaffold(
        padding: EdgeInsets.zero,
        extendBodyBehindTitle: true,
        extendBodyBehindAppBar: true,
        appBar: const OrbAppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                              children: [
                                OrbText(
                                  '정보',
                                  type: OrbTextType.titleSmall,
                                  fontWeight: OrbFontWeight.medium,
                                ),
                                const Spacer(),
                                OrbIcon(
                                  Icons.favorite_rounded,
                                  color: context.palette.surface,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            VolunteerDetailRow(
                              label: '봉사기간',
                              value: '2021.09.01 ~ 2021.09.30',
                            ),
                            const OrbDivider(),
                            VolunteerDetailRow(
                              label: '모집기간',
                              value: '2021.09.01 ~ 2021.09.30',
                            ),
                            const OrbDivider(),
                            VolunteerDetailRow(
                              label: '모집인원',
                              value: '10명 / 일',
                            ),
                            const OrbDivider(),
                            VolunteerDetailRow(
                              label: '모집기관',
                              value: '서울동물복지센터',
                            ),
                            const OrbDivider(),
                            VolunteerDetailRow(
                              label: '봉사장소',
                              value: '서울특별시 강남구 역삼동 123-456',
                            ),
                            const OrbDivider(),
                            VolunteerDetailRow(
                              label: '봉사시간',
                              value: '오전 10:00 ~ 오후 5:00',
                            ),
                            const OrbDivider(),
                            VolunteerDetailRow(
                              label: '활동요일',
                              value: '월, 화, 수, 목, 금',
                            ),
                            const OrbDivider(),
                            VolunteerDetailRow(
                              label: '신청인원',
                              value: '10명 / 100명',
                            ),
                            const OrbDivider(),
                            VolunteerDetailRow(
                              label: '봉사자유형',
                              value: '성인',
                            ),
                            const OrbDivider(),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: OrbFilledButton(
                onPressed: () {
                  ref
                      .read(routerServiceProvider)
                      .push(const VolunteerApplyRoute());
                },
                text: '신청하러 가기',
              ),
            ),
          ],
        ),
      );
    });
  }
}

class VolunteerDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const VolunteerDetailRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
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
