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
                            homeBoard.volunteers.location,
                            type: OrbTextType.bodySmall,
                            color: context.palette.surfaceDim,
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: OrbIcon(Icons.chevron_right_outlined),
                  child: homeBoard.volunteers.volunteers.isEmpty
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
                          child: Row(
                            children: [
                              ...homeBoard.volunteers.volunteers.map(
                                (volunteer) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: HomeVolunteerCard(
                                      title: volunteer.title,
                                      organizationName:
                                          volunteer.organizationName,
                                      region: volunteer.region,
                                      registrationDate:
                                          volunteer.registrationDate,
                                      imageUrl: volunteer.imageUrl,
                                      duration: volunteer.duration,
                                    ),
                                  );
                                },
                              ),
                            ],
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
                    final communities = homeBoard.communities;
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
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: HomeCommunityCard(
                                      title: community.title,
                                      content: community.content,
                                      imageUrl: community.imageUrl,
                                      likes: community.likes,
                                      comments: community.comments,
                                    ),
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
              homeBoard.when(
                data: (homeBoard) {
                  final crewBoard = homeBoard.crews;
                  return crewBoard.crews.isEmpty
                      ? const SizedBox()
                      : OrbBoardContainer(
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
                                    crewBoard.location,
                                    type: OrbTextType.bodySmall,
                                    color: context.palette.surfaceDim,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: OrbIcon(Icons.chevron_right_outlined),
                          child: Column(
                            children: [
                              ...crewBoard.crews.map(
                                (crew) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: OrbInfoCard(
                                      imageUrl: crew.imageUrl,
                                      title: crew.title,
                                      description: crew.description,
                                      infoItems: [
                                        OrbInfoItem(
                                          icon: OrbIcon(
                                            Icons.location_on_outlined,
                                            size: OrbIconSize.small,
                                          ),
                                          text: crew.location,
                                        ),
                                        OrbInfoItem(
                                          icon: OrbIcon(
                                            Icons.person,
                                            size: OrbIconSize.small,
                                          ),
                                          text: "${crew.membersCount}명",
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
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
