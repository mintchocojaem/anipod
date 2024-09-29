import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../design_system/orb/orb.dart';
import '../providers/home_board_provider.dart';
import '../widgets/home_community_card.dart';
import '../widgets/home_volunteer_card.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeBoard = ref.watch(homeBoardProvider);
    return OrbScaffold(
      padding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: context.palette.surfaceBright,
      appBar: OrbAppBar(
        title: "Anipod",
      ),
      body: OrbRefreshIndicator(
        onRefresh: () async {
          ref.invalidate(homeBoardProvider);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              homeBoard.when(
                data: (homeBoard) {
                  return OrbBanner(
                    urls: homeBoard.banners.map((e) => e.imageUrl).toList(),
                    onTap: (int index) {},
                    onPageChanged: (int index) {},
                  );
                },
                loading: () => OrbBanner(
                  urls: [],
                  onTap: (int index) {},
                  onPageChanged: (int index) {},
                ),
                error: (error, stackTrace) => OrbBanner(
                  urls: [],
                  onTap: (int index) {},
                  onPageChanged: (int index) {},
                ),
              ),
              SizedBox(
                height: 8,
              ),
              homeBoard.when(data: (homeBoard) {
                return OrbBoardContainer(
                  isHorizontalScrollable: true,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrbText(
                        '김댕댕님을 위한 새로운 봉사활동',
                        type: OrbTextType.titleSmall,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          OrbIcon(
                            Icons.location_on_outlined,
                            size: OrbIconSize.small,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          OrbText(
                            '위치 정보',
                            type: OrbTextType.bodySmall,
                            color: context.palette.surfaceDim,
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: OrbIcon(Icons.chevron_right_outlined),
                  child: homeBoard.volunteers.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 64,
                            ),
                            child: OrbText(
                              '새로운 봉사활동 글이 존재하지 않아요.',
                              type: OrbTextType.bodyLarge,
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                ...homeBoard.volunteers.map(
                                  (volunteer) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: HomeVolunteerCard(
                                        title: volunteer.title,
                                        organizationName:
                                            volunteer.recruitmentAgency,
                                        region: volunteer.volunteerPlace,
                                        registrationDate: volunteer.createdAt,
                                        imageUrl:
                                            volunteer.images.firstOrNull?.url,
                                        duration: volunteer.deadline,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                );
              }, loading: () {
                return OrbBoardContainer(
                  title: OrbText(
                    '김댕댕님을 위한 새로운 봉사활동',
                    type: OrbTextType.titleSmall,
                    fontWeight: OrbFontWeight.medium,
                  ),
                  trailing: OrbIcon(Icons.chevron_right_outlined),
                  child: OrbShimmerContent(),
                );
              }, error: (error, stackTrace) {
                return OrbBoardContainer(
                  title: OrbText(
                    '김댕댕님을 위한 새로운 봉사활동',
                    type: OrbTextType.titleSmall,
                    fontWeight: OrbFontWeight.medium,
                  ),
                  trailing: OrbIcon(Icons.chevron_right_outlined),
                  child: OrbShimmerContent(),
                );
              }),
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
                child: homeBoard.when(
                  data: (homeBoard) {
                    final communities = homeBoard.posts;
                    return communities.isEmpty
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 64,
                              ),
                              child: OrbText(
                                '새로운 커뮤니티 글이 존재하지 않아요.',
                                type: OrbTextType.bodyLarge,
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              ...communities.map(
                                (community) {
                                  return Column(
                                    children: [
                                      HomeCommunityCard(
                                        title: community.title,
                                        content: community.body,
                                        imageUrl: community.images.firstOrNull,
                                        likes: community.likes,
                                        comments: community.comments,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      OrbDivider(),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          );
                  },
                  loading: () => OrbShimmerContent(),
                  error: (error, stackTrace) => OrbShimmerContent(),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              OrbBoardContainer(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrbText(
                      '내 주변 크루',
                      type: OrbTextType.titleSmall,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        OrbIcon(
                          Icons.location_on_outlined,
                          size: OrbIconSize.small,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        OrbText(
                          '위치 정보',
                          type: OrbTextType.bodySmall,
                          color: context.palette.surfaceDim,
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: OrbIcon(Icons.chevron_right_outlined),
                child: homeBoard.when(
                  data: (homeBoard) {
                    final crewBoard = homeBoard.crews;
                    return crewBoard.isEmpty
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 64,
                              ),
                              child: OrbText(
                                '새로운 크루가 존재하지 않아요.',
                                type: OrbTextType.bodyLarge,
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              ...crewBoard.map(
                                (crew) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: OrbInfoCard(
                                      imageUrl: null,
                                      fallbackIcon: Icons.people,
                                      title: crew.name,
                                      description: crew.description,
                                      infoItems: [
                                        OrbInfoItem(
                                          icon: OrbIcon(
                                            Icons.location_on_outlined,
                                            size: OrbIconSize.small,
                                          ),
                                          text: crew.neighborhood,
                                        ),
                                        OrbInfoItem(
                                          icon: OrbIcon(
                                            Icons.person,
                                            size: OrbIconSize.small,
                                          ),
                                          text: "${crew.memberCount}명",
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                  },
                  loading: () => OrbBoardContainer(
                    title: OrbText(
                      '내 주변 크루',
                      type: OrbTextType.titleSmall,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    trailing: OrbIcon(Icons.chevron_right_outlined),
                    child: OrbShimmerContent(),
                  ),
                  error: (error, stackTrace) => OrbBoardContainer(
                    title: OrbText(
                      '내 주변 크루',
                      type: OrbTextType.titleSmall,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    trailing: OrbIcon(Icons.chevron_right_outlined),
                    child: OrbShimmerContent(),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
