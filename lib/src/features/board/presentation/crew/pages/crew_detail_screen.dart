import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../core/utils/app_exception.dart';
import '../providers/crew_detail_provider.dart';

@RoutePage()
class CrewDetailScreen extends HookWidget {
  final String crewId;

  const CrewDetailScreen({
    super.key,
    required this.crewId,
  });

  @override
  Widget build(BuildContext context) {
    // SliverAppBar의 확장 높이
    final double expandedHeight = MediaQuery.of(context).size.width;

    return Consumer(
      builder: (context, ref, child) {
        final crewDetail = ref.watch(crewDetailProvider(crewId));
        final crewNotifier = ref.read(crewDetailProvider(crewId).notifier);

        ref.listen(
          crewDetailProvider(crewId),
          (_, next) {
            if (!next.isLoading && next.hasError) {
              final error = next.error;
              if (error is! AppException) return;
              context.showErrorSnackBar(
                error: error,
              );
            }
          },
        );

        return OrbScaffold(
          padding: EdgeInsets.zero,
          disableSafeAreaBottom: true,
          appBar: OrbAppBar(
            title: '크루 정보',
            centerTitle: true,
            backgroundColor: context.palette.background,
          ),
          body: crewDetail.when(
            skipLoadingOnReload: true,
            skipError: true,
            data: (data) {
              return OrbRefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(crewDetailProvider(crewId));
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          // 배경 이미지
                          Container(
                            height: expandedHeight,
                            decoration: BoxDecoration(
                              color: context.palette.surfaceBright,
                              image: data.backgroundImageUrl != null
                                  ? DecorationImage(
                                      image: NetworkImage(
                                        data.backgroundImageUrl!,
                                      ),
                                      fit: BoxFit.cover,
                                      onError: (error, stackTrace) {
                                        print("Image Loading Error : $error");
                                      },
                                    )
                                  : null,
                            ),
                            child: data.backgroundImageUrl == null
                                ? const Center(
                                    child: OrbText(
                                      '배경 이미지가 없습니다.',
                                      type: OrbTextType.bodyMedium,
                                    ),
                                  )
                                : null,
                          ),
                          // 상단 둥근 모서리 배경
                          Positioned(
                            top: expandedHeight - 24,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 24,
                              decoration: BoxDecoration(
                                color: context.palette.background,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: context.palette.surfaceBright,
                                        shape: BoxShape.circle,
                                        image: data.profileImageUrl != null
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                  data.profileImageUrl!,
                                                ),
                                                onError: (error, stackTrace) {
                                                  print(
                                                      "Image Loading Error : $error");
                                                },
                                              )
                                            : null,
                                      ),
                                      child: data.profileImageUrl == null
                                          ? Center(
                                              child: OrbIcon(
                                                Icons.person,
                                                color: context.palette.surface,
                                              ),
                                            )
                                          : null,
                                    ),
                                    const SizedBox(width: 16),
                                    OrbText(
                                      data.name,
                                      type: OrbTextType.titleSmall,
                                      fontWeight: OrbFontWeight.medium,
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        // 알림 설정
                                        ref.read(routerServiceProvider).push(
                                              CrewWaitListRoute(
                                                crewId: crewId,
                                              ),
                                            );
                                      },
                                      child: OrbIcon(
                                        Icons.more_vert_rounded,
                                        color: context.palette.surface,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            OrbText(
                              data.description,
                              type: OrbTextType.bodyMedium,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: data.tag
                                  .map(
                                    (tag) => Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: context.palette.surfaceBright,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: OrbText(
                                        tag,
                                        type: OrbTextType.bodySmall,
                                        fontWeight: OrbFontWeight.medium,
                                        color: context.palette.surfaceDim,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      const OrbRoundedContainerDivider(),
                      // 앨범 섹션
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 앨범 제목
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OrbText(
                                  '앨범 ${data.imageCount}',
                                  type: OrbTextType.titleSmall,
                                  fontWeight: OrbFontWeight.medium,
                                ),
                                Row(
                                  children: [
                                    OrbText('전체보기',
                                        type: OrbTextType.bodyMedium),
                                    const SizedBox(width: 4),
                                    OrbIcon(
                                      size: OrbIconSize.small,
                                      Icons.chevron_right_rounded,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            // 앨범 그리드
                            GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1,
                              ),
                              itemCount:
                                  data.imageCount > 9 ? 9 : data.imageCount,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: context.palette.surfaceBright,
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        data.images[index].url,
                                      ),
                                      fit: BoxFit.cover,
                                      onError: (exception, stackTrace) {
                                        print("Image Loading Error");
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const OrbRoundedContainerDivider(),
                      // 크루 섹션
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 크루 제목
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OrbText(
                                  '크루 멤버 ${data.memberCount}',
                                  type: OrbTextType.titleSmall,
                                  fontWeight: OrbFontWeight.medium,
                                ),
                                Row(
                                  children: [
                                    OrbText(
                                      '전체보기',
                                      type: OrbTextType.bodyMedium,
                                    ),
                                    const SizedBox(width: 4),
                                    OrbIcon(
                                      size: OrbIconSize.small,
                                      Icons.chevron_right_rounded,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            // 크루 리스트
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.members.length > 5
                                  ? 5
                                  : data.members.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: context.palette.surfaceBright,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://picsum.photos/200/200',
                                            ),
                                            onError: (exception, stackTrace) {
                                              print("Image Loading Error");
                                            },
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              OrbText(
                                                data.members[index].nickname,
                                                type: OrbTextType.bodyMedium,
                                                fontWeight:
                                                    OrbFontWeight.medium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const OrbRoundedContainerDivider(),
                      /*
                      const OrbRoundedContainerDivider(),
                      //일정 섹션

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 크루 제목
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OrbText(
                              '일정 4',
                              type: OrbTextType.titleSmall,
                              fontWeight: OrbFontWeight.medium,
                            ),
                            Row(
                              children: [
                                OrbText(
                                  '전체보기',
                                  type: OrbTextType.bodyMedium,
                                ),
                                const SizedBox(width: 4),
                                OrbIcon(
                                  size: OrbIconSize.small,
                                  Icons.chevron_right_rounded,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // 일정 리스트
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: context.palette.surfaceBright,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        OrbText(
                                          '7월',
                                          type: OrbTextType.bodySmall,
                                          fontWeight: OrbFontWeight.medium,
                                          color: context.palette.surfaceDim,
                                        ),
                                        OrbText(
                                          '16',
                                          type: OrbTextType.bodyLarge,
                                          fontWeight: OrbFontWeight.medium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      OrbText(
                                        '크루 이름',
                                        type: OrbTextType.bodyLarge,
                                        fontWeight: OrbFontWeight.medium,
                                      ),
                                      const SizedBox(height: 4),
                                      OrbText(
                                        '모집중',
                                        type: OrbTextType.bodySmall,
                                        color: context.palette.primary,
                                        fontWeight: OrbFontWeight.medium,
                                      ),
                                      const SizedBox(height: 4),
                                      OrbText(
                                        '오전 08:12',
                                        type: OrbTextType.bodySmall,
                                        color: context.palette.surfaceDim,
                                        fontWeight: OrbFontWeight.medium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const OrbRoundedContainerDivider(),


                  // 게시판 섹션
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 게시판 제목
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OrbText(
                              '게시판 23',
                              type: OrbTextType.titleSmall,
                              fontWeight: OrbFontWeight.medium,
                            ),
                            Row(
                              children: [
                                OrbText(
                                  '전체보기',
                                  type: OrbTextType.bodyMedium,
                                ),
                                const SizedBox(width: 4),
                                OrbIcon(
                                  size: OrbIconSize.small,
                                  Icons.chevron_right_rounded,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // 게시글 리스트
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CrewBoardCard(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 24,
                                  ),
                                  name: '사용자 이름',
                                  title: '게시글 제목',
                                  content: '게시글 내용 asdklsaj\nkla sdljkdasj kdask',
                                  commentCount: 3,
                                  likeCount: 5,
                                  imageUrl: 'https://picsum.photos/200/200',
                                  time: '2021-07-16T08:12:00',
                                ),
                                OrbDivider(),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                   */
                    ],
                  ),
                ),
              );
            },
            loading: () => Center(
              child: OrbCircularProgressIndicator(),
            ),
            error: (error, stack) {
              return Center(
                child: OrbCircularProgressIndicator(),
              );
            },
          ),
          bottomNavigationBar:
              crewDetail.value == null || crewDetail.value!.member
                  ? null
                  : SafeArea(
                      child: Container(
                        height: 72,
                        decoration: BoxDecoration(
                          color: context.palette.background,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(0, -4),
                              blurRadius: 4,
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          bottom: 8,
                          top: 8,
                        ),
                        child: Row(
                          children: [
                            /*
                  IconButton(
                    onPressed: () {},
                    icon: OrbIcon(
                      Icons.favorite_rounded,
                    ),
                  ),
                  const SizedBox(width: 16),

                   */
                            Expanded(
                              child: OrbFilledButton(
                                text: '가입하기',
                                buttonSize: OrbButtonSize.compact,
                                onPressed: () async {
                                  await crewNotifier.join();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
