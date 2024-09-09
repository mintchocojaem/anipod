import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class FindCrewScreen extends StatelessWidget {
  const FindCrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      padding: EdgeInsets.zero,
      disableSafeAreaBottom: true,
      appBar: OrbAppBar(
        title: '죽전동 크루',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              decoration: BoxDecoration(
                color: context.palette.background,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      OrbText(
                        '새로 생겼어요',
                        type: OrbTextType.titleSmall,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const Spacer(),
                      OrbText(
                        '전체보기',
                      ),
                      OrbIcon(
                        Icons.chevron_right_rounded,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: index == 2 ? 0 : 24),
                        child: OrbInfoCard(
                          imageUrl: 'https://via.placeholder.com/1080x540',
                          title: '산책 봉사활동 모집...123',
                          description: '서울 유기견 보호센터',
                          infoItems: [
                            OrbInfoItem(
                              icon: OrbIcon(
                                Icons.location_on_outlined,
                                size: OrbIconSize.small,
                              ),
                              text: '죽전동',
                            ),
                            OrbInfoItem(
                              icon: OrbIcon(
                                Icons.person,
                                size: OrbIconSize.small,
                              ),
                              text: '11명',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 56,
                  color: context.palette.surfaceBright,
                ),
                Positioned.fill(
                  top: 0,
                  bottom: 32,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.palette.background,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 32,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.palette.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              decoration: BoxDecoration(
                color: context.palette.background,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrbText(
                    '우리동네 크루',
                    type: OrbTextType.titleSmall,
                    fontWeight: OrbFontWeight.medium,
                  ),
                  const SizedBox(height: 16),
                  OrbCategoryBar(
                    horizontalPadding: 0,
                    currentIndex: 0,
                    categoryList: [
                      '전체',
                      '추천',
                      '인기',
                      '최신',
                      '거리',
                    ],
                    onIndexChanged: (index) {},
                  ),
                  const SizedBox(height: 24),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: OrbInfoCard(
                          imageUrl: 'https://via.placeholder.com/1080x540',
                          title: '산책 봉사활동 모집...123',
                          description: '서울 유기견 보호센터',
                          infoItems: [
                            OrbInfoItem(
                              icon: OrbIcon(
                                Icons.location_on_outlined,
                                size: OrbIconSize.small,
                              ),
                              text: '죽전동',
                            ),
                            OrbInfoItem(
                              icon: OrbIcon(
                                Icons.person,
                                size: OrbIconSize.small,
                              ),
                              text: '11명',
                            ),
                          ],
                        ),
                      );
                    },
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
