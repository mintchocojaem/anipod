import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/features/board/presentation/community/widgets/crew_profile_item.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';
import '../widgets/community_list_item.dart';

@RoutePage()
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: context.palette.surfaceBright,
      appBar: const OrbAppBar(
        title: '커뮤니티',
        centerTitle: true,
        trailing: OrbIcon(Icons.search),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: context.palette.background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrbText(
                          '죽전동',
                          type: OrbTextType.bodySmall,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        OrbText(
                          '크루로 활동하기',
                          type: OrbTextType.bodyLarge,
                          fontWeight: OrbFontWeight.medium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: context.palette.surfaceBright,
                                width: 2,
                              ),
                            ),
                          ),
                          child: CrewProfileItem(
                            imageUrl: 'http://via.placeholder.com/128x128',
                            title: '단국대 미소',
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CrewProfileItem(
                                    imageUrl:
                                        'http://via.placeholder.com/128x128',
                                    title: '단국대 미소',
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  CrewProfileItem(
                                    imageUrl:
                                        'http://via.placeholder.com/128x128',
                                    title: '죽전동 공원 모임',
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  CrewProfileItem(
                                    imageUrl:
                                        'http://via.placeholder.com/128x128',
                                    title: '죽전동 공원 모임',
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  CrewProfileItem(
                                    imageUrl:
                                        'http://via.placeholder.com/128x128',
                                    title: '죽전동 공원 모임',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                color: context.palette.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrbCategoryBar(
                      currentIndex: 0,
                      categoryList: const [
                        '전체',
                        '인기',
                        '봉사',
                        '리뷰',
                        '생활',
                      ],
                      onIndexChanged: (index) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const OrbDivider(),
                    ListView.builder(
                        itemCount: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const Column(
                            children: [
                              CommunityListItem(
                                imageUrl: 'https://via.placeholder.com/128x128',
                                title: '단국대 미소',
                                content: '단국대 미소',
                                tags: ['봉사', '리뷰'],
                                time: '1시간 전',
                                likeCount: 10,
                                commentCount: 5,
                              ),
                              OrbDivider(),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
