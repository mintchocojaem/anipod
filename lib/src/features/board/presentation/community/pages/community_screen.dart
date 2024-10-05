import 'package:anipod/src/core/services/router/router_service.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../core/utils/app_exception.dart';
import '../../../domain/models/community_category.dart';
import '../providers/community_board_provider.dart';
import '../providers/community_category_provider.dart';
import '../providers/community_crews_provider.dart';
import '../widgets/community_board_card.dart';
import '../widgets/community_crew_profile.dart';

@RoutePage()
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final crewProfiles =
          ref.watch(communityCrewsProvider); // CrewProfileProvider에서 데이터를 가져옴
      final communityBoard = ref.watch(communityBoardProvider); // 게시판 데이터
      List<String> categories = [
        '전체',
        ...CommunityCategoryModel.values.map((e) {
          return e.displayName;
        }),
      ];

      ref.listen(communityCrewsProvider, (_, next) {
        if (!next.isLoading && next.hasError) {
          final error = next.error;
          if (error is! AppException) return;
          context.showErrorSnackBar(
            error: error,
          );
        }
      });

      ref.listen(communityBoardProvider, (_, next) {
        if (!next.isLoading && next.hasError) {
          final error = next.error;
          if (error is! AppException) return;
          context.showErrorSnackBar(
            error: error,
          );
        }
      });

      return HookBuilder(builder: (context) {
        final categoryIndex = useState(0); // 카테고리 인덱스 관리
        final scrollController = useScrollController();
        final isFetchingNextPage = useState(false); // 중복 요청 방지 플래그

        // 무한 스크롤링을 처리하는 리스너 설정
        useEffect(() {
          listener() async {
            if (!isFetchingNextPage.value &&
                scrollController.position.pixels >=
                    scrollController.position.maxScrollExtent - 100) {
              // 데이터를 가져오는 중임을 표시
              isFetchingNextPage.value = true;
              await ref.read(communityBoardProvider.notifier).fetchNext();
              // 데이터 로딩이 끝나면 다시 false로 설정
              isFetchingNextPage.value = false;
            }
          }

          scrollController.addListener(listener);
          return () {
            scrollController.removeListener(listener);
          };
        }, []);

        return OrbScaffold(
          padding: EdgeInsets.zero,
          appBar: const OrbAppBar(
            title: '커뮤니티',
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: context.palette.primary,
            onPressed: () {
              ref
                  .read(routerServiceProvider)
                  .push(const CommunityPostAddRoute());
            },
            child: OrbIcon(
              Icons.edit,
              color: context.palette.onPrimary,
            ),
          ),
          body: OrbRefreshIndicator(
            onRefresh: () async {
              ref.invalidate(communityCrewsProvider);
              ref.invalidate(communityBoardProvider);
            },
            child: SingleChildScrollView(
              controller: scrollController, // 무한 스크롤링을 위한 컨트롤러 추가
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // 크루 프로필 섹션
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.palette.background,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // 크루 섹션 헤더
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OrbText(
                                '죽전동',
                                type: OrbTextType.bodySmall,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  OrbText(
                                    '크루로 활동하기',
                                    type: OrbTextType.bodyLarge,
                                    fontWeight: OrbFontWeight.medium,
                                  ),
                                  const SizedBox(width: 16),
                                  InkWell(
                                    onTap: () {
                                      ref
                                          .read(routerServiceProvider)
                                          .push(const CrewFindRoute());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: context.palette.primary,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        children: [
                                          OrbIcon(
                                            Icons.search,
                                            size: OrbIconSize.small,
                                            color: context.palette.onPrimary,
                                          ),
                                          const SizedBox(width: 4),
                                          OrbText(
                                            '크루 찾기',
                                            type: OrbTextType.bodySmall,
                                            fontWeight: OrbFontWeight.medium,
                                            color: context.palette.onPrimary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // 크루 프로필 리스트
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: context.palette.background,
                          ),
                          child: crewProfiles.when(
                            data: (profiles) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 24),
                                    ...profiles.map(
                                      (profile) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: CommunityCrewProfile(
                                          imageUrl: profile.profileImageUrl,
                                          title: profile.name,
                                          onTap: () {
                                            ref
                                                .read(routerServiceProvider)
                                                .push(CrewDetailRoute(
                                                    crewId: profile.crewId));
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            loading: () => const OrbShimmerContent(),
                            error: (error, stackTrace) =>
                                const OrbShimmerContent(),
                          ),
                        ),
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
                        // 커뮤니티 카테고리 바
                        OrbCategoryBar(
                          currentIndex: categoryIndex.value, // 현재 선택된 카테고리
                          categoryList:
                              categories.map((e) => e).toList(), // 카테고리 이름 리스트
                          onIndexChanged: (index) {
                            categoryIndex.value = index;
                            ref
                                .read(communityCategoryProvider.notifier)
                                .selectCategory(
                                  index == 0
                                      ? null
                                      : CommunityCategoryModel
                                          .values[index - 1],
                                );
                          },
                        ),
                        const SizedBox(height: 24),
                        const OrbDivider(),
                        // 게시판 데이터 로드 및 출력
                        communityBoard.when(
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
                                      final post = board.content[index];
                                      return Column(
                                        children: [
                                          CommunityBoardCard(
                                            name: post.author,
                                            title: post.title,
                                            content: post.body,
                                            commentCount: post.comments,
                                            likeCount: post.likes,
                                            imageUrl:
                                                post.images.firstOrNull?.url,
                                            time: post.createdAt,
                                            onTap: () {
                                              ref
                                                  .read(routerServiceProvider)
                                                  .push(
                                                    CommunityPostDetailRoute(
                                                        postId: post.id),
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
                        const SizedBox(height: 24),
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
