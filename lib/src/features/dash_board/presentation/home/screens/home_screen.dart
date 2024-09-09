import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';
import '../widgets/community_card.dart';
import '../widgets/volunteer_card.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      padding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: context.palette.surfaceBright,
      appBar: OrbAppBar(
        title: "Anipod",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrbBanner(
              urls: [
                'http://via.placeholder.com/1080x540',
                'http://via.placeholder.com/1080x540',
              ],
              onTap: (int index) {},
              onPageChanged: (int index) {},
            ),
            SizedBox(
              height: 8,
            ),
            OrbBoardContainer(
              title: OrbText(
                '김댕댕님을 위한 새로운 봉사활동',
                type: OrbTextType.titleSmall,
                fontWeight: OrbFontWeight.medium,
              ),
              trailing: OrbIcon(Icons.chevron_right_outlined),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: VolunteerCard(
                        title: '산책 봉사활동 모집...',
                        organizationName: '서울 유기견 보호센터',
                        region: '강원 홍천',
                        registrationDate: '2024-02-28',
                        imagePlaceholder: '',
                        duration: 'D-5',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: VolunteerCard(
                        title: '산책 봉사활동 모집...',
                        organizationName: '서울 유기견 보호센터',
                        region: '강원 홍천',
                        registrationDate: '2024-02-28',
                        imagePlaceholder: '',
                        duration: 'D-5',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            OrbBoardContainer(
              title: OrbText(
                '커뮤니티',
                type: OrbTextType.titleSmall,
                fontWeight: OrbFontWeight.medium,
              ),
              trailing: OrbIcon(Icons.chevron_right_outlined),
              child: Column(
                children: [
                  CommunityCard(
                    title: "웰시코기",
                    content:
                        "집 근처에서 작은 아기 고양이가 있었는데 부모가 없는 것 같더라구요ㅜㅜ 혼자 있길래 일단 먹이 사와..",
                    imageUrl: 'http://via.placeholder.com/128x128',
                    likes: 21,
                    comments: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: OrbDivider(),
                  ),
                  CommunityCard(
                    title: "웰시코기",
                    content:
                        "집 근처에서 작은 아기 고양이가 있었는데 부모가 없는 것 같더라구요ㅜㅜ 혼자 있길래 일단 먹이 사와..",
                    imageUrl: 'http://via.placeholder.com/128x128',
                    likes: 212,
                    comments: 812,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            OrbBoardContainer(
              title: OrbText(
                '내 주변 크루',
                type: OrbTextType.titleSmall,
                fontWeight: OrbFontWeight.medium,
              ),
              trailing: OrbIcon(Icons.chevron_right_outlined),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: OrbInfoCard(
                      imageUrl: 'https://via.placeholder.com/128x128',
                      title: '죽전동 새로 생긴 크루 1',
                      description: '크루 소개글',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: OrbInfoCard(
                      imageUrl: 'https://via.placeholder.com/128x128',
                      title: '죽전동 새로 생긴 크루 1',
                      description: '크루 소개글',
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
