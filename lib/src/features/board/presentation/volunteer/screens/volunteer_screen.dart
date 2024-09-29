import 'package:anipod/src/core/services/router/router_service.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:anipod/src/features/board/presentation/volunteer/widgets/guide_card.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.gr.dart';
import '../../../domain/models/volunteer_category.dart';
import '../providers/volunteer_board_provider.dart';
import '../providers/volunteer_guide_provider.dart';
import '../widgets/volunteer_list_item.dart';

@RoutePage()
class VolunteerScreen extends StatelessWidget {
  const VolunteerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final volunteerBoard = ref.watch(volunteerBoardProvider);
      final volunteerGuide = ref.watch(volunteerGuideProvider);
      return HookBuilder(builder: (context) {
        const category = VolunteerCategoryModel.values;
        final categoryIndex = useState(0);

        final scrollController = useScrollController();
        bool isFetchingNextPage = false;

        useEffect(() {
          listener() async {
            if (!isFetchingNextPage &&
                scrollController.position.pixels >=
                    scrollController.position.maxScrollExtent - 100) {
              // 데이터를 가져오는 중임을 표시
              isFetchingNextPage = true;
              await ref.read(volunteerBoardProvider.notifier).fetchNextBoard();
              // 데이터 로딩이 끝나면 다시 false로 설정
              isFetchingNextPage = false;
            }
          }

          scrollController.addListener(listener);
          return () {
            scrollController.removeListener(listener);
          };
        }, []);

        useEffect(() {
          ref.read(volunteerBoardProvider.notifier).fetchBoard(
                category: category[categoryIndex.value],
              );
          ref.invalidate(volunteerBoardProvider);
          return null;
        }, [categoryIndex.value]);

        return OrbScaffold(
          padding: EdgeInsets.zero,
          appBar: const OrbAppBar(
            title: '봉사활동',
            centerTitle: true,
            trailing: OrbIcon(Icons.search),
          ),
          body: OrbRefreshIndicator(
            onRefresh: () async {
              ref.invalidate(volunteerBoardProvider);
            },
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.palette.background,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              OrbIcon(
                                Icons.check_rounded,
                                color: context.palette.primary,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              OrbText(
                                '봉사활동 전 확인하기',
                                type: OrbTextType.bodyLarge,
                                fontWeight: OrbFontWeight.medium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        volunteerGuide.when(data: (volunteerGuide) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 24,
                                ),
                                ...volunteerGuide.map(
                                  (guide) => Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: GuideCard(
                                      content: guide.content,
                                      icon: OrbIcon(
                                        Icons.gpp_good_outlined,
                                        color: context.palette.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }, loading: () {
                          return OrbShimmerContent();
                        }, error: (error, stackTrace) {
                          return OrbShimmerContent();
                        }),
                      ],
                    ),
                  ),
                  const OrbRoundedContainerDivider(),
                  Container(
                    decoration: BoxDecoration(
                      color: context.palette.background,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrbCategoryBar(
                          currentIndex: categoryIndex.value,
                          categoryList:
                              category.map((e) => e.displayName).toList(),
                          onIndexChanged: (index) {
                            categoryIndex.value = index;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const OrbDivider(),
                        volunteerBoard.when(
                          skipLoadingOnRefresh: false,
                          data: (board) {
                            return board.content.isEmpty
                                ? const SizedBox(
                                    height: 300,
                                    child: Center(
                                      child: OrbText(
                                        '게시글이 존재하지 않아요.',
                                        type: OrbTextType.bodyLarge,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: board.content.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final volunteerPost =
                                          board.content[index];
                                      return Column(
                                        children: [
                                          VolunteerListItem(
                                            title: volunteerPost.title,
                                            organization:
                                                volunteerPost.recruitmentAgency,
                                            region:
                                                volunteerPost.volunteerPlace,
                                            registrationDate:
                                                volunteerPost.createdAt,
                                            photos: volunteerPost.images
                                                .map((e) => e.url)
                                                .toList(),
                                            duration: volunteerPost.deadline,
                                            onTap: () {
                                              ref
                                                  .read(routerServiceProvider)
                                                  .push(
                                                    VolunteerDetailRoute(),
                                                  );
                                            },
                                          ),
                                          const OrbDivider(),
                                          if (index ==
                                                  board.content.length - 1 &&
                                              board.hasNext)
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 24,
                                              ),
                                              child:
                                                  OrbCircularProgressIndicator(),
                                            ),
                                        ],
                                      );
                                    },
                                  );
                          },
                          loading: () {
                            return ListView.builder(
                              itemCount: 5,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return const OrbShimmerContent();
                              },
                            );
                          },
                          error: (error, stackTrace) {
                            return ListView.builder(
                              itemCount: 5,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return const OrbShimmerContent();
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
