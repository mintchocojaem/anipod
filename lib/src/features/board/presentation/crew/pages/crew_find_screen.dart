import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../design_system/orb/orb.dart';
import '../providers/crew_find_board_provider.dart';

@RoutePage()
class CrewFindScreen extends StatelessWidget {
  const CrewFindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final crewFindNewBoard = ref.watch(crewFindNewBoardProvider);
      final crewFindNeighborhoodBoard =
          ref.watch(crewFindNeighborhoodBoardProvider);
      return OrbScaffold(
        padding: EdgeInsets.zero,
        disableSafeAreaBottom: true,
        appBar: OrbAppBar(
          title: '죽전동 크루',
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.palette.primary,
          onPressed: () {
            ref.read(routerServiceProvider).push(const CrewAddRoute());
          },
          child: OrbIcon(
            Icons.person_add_alt_1,
            color: context.palette.onPrimary,
          ),
        ),
        body: OrbRefreshIndicator(
          onRefresh: () async {
            ref.invalidate(crewFindNewBoardProvider);
            ref.invalidate(crewFindNeighborhoodBoardProvider);
          },
          child: SingleChildScrollView(
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
                        ],
                      ),
                      const SizedBox(height: 16),
                      crewFindNewBoard.when(data: (crewFindBoardModel) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: crewFindBoardModel.content.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final crew = crewFindBoardModel.content[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: OrbInfoCard(
                                imageUrl: crew.profileImageUrl,
                                fallbackIcon: Icons.person,
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
                                    text: '${crew.memberCount}명',
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }, loading: () {
                        return const OrbShimmerContent();
                      }, error: (error, stackTrace) {
                        return OrbShimmerContent();
                      }),
                    ],
                  ),
                ),
                const OrbRoundedContainerDivider(),
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
                      crewFindNeighborhoodBoard.when(
                          data: (crewFindBoardModel) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: crewFindBoardModel.content.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final crew = crewFindBoardModel.content[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: OrbInfoCard(
                                imageUrl: crew.profileImageUrl,
                                fallbackIcon: Icons.person,
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
                                    text: '${crew.memberCount}명',
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }, loading: () {
                        return const OrbShimmerContent();
                      }, error: (error, stackTrace) {
                        return OrbShimmerContent();
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
