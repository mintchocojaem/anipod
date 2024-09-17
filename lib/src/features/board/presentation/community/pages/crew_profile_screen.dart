import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../widgets/crew_board_card.dart';

@RoutePage()
class CrewProfileScreen extends HookWidget {
  const CrewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> crewTags = ['죽전동', '봉사', '20~30세'];

    final scrollController = useScrollController();

    // SliverAppBar의 확장 높이
    final double expandedHeight = MediaQuery.of(context).size.width;

    // 스크롤 오프셋을 추적하는 상태 변수
    final scrollOffset = useState(0.0);

    // 스크롤 리스너 추가
    useEffect(() {
      scrollController.addListener(() {
        scrollOffset.value = scrollController.offset;
      });
      return null; // 리스너를 제거하지 않음
    }, [scrollController]);

    return Consumer(
      builder: (context, ref, child) {
        return OrbScaffold(
          padding: EdgeInsets.zero,
          bottomNavigationBar: SafeArea(
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
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: OrbIcon(
                      Icons.favorite_rounded,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OrbFilledButton(
                      text: '가입하기',
                      buttonSize: OrbButtonSize.compact,
                      onPressed: () {
                        // 가입하기 버튼 동작
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: context.palette.background,
                  surfaceTintColor: context.palette.background,
                  expandedHeight: expandedHeight,
                  pinned: true,
                  centerTitle: true,
                  title: OrbText(
                    '크루 프로필',
                    type: OrbTextType.titleSmall,
                  ),
                  actions: [],
                  flexibleSpace: Stack(
                    children: [
                      // 배경 이미지
                      FlexibleSpaceBar(
                        background: Container(
                          height: expandedHeight,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://picsum.photos/1024/1024',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // 상단 둥근 모서리 배경
                      Positioned(
                        top: (expandedHeight - scrollOffset.value - 24) > 0
                            ? (expandedHeight - scrollOffset.value - 24)
                            : 0,
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
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // 상단 정보 섹션
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 프로필 이미지
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: context.palette.surfaceBright,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // 크루 정보
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 크루 이름 및 설명
                              SizedBox(
                                height: 64,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        OrbText(
                                          'Crew Name',
                                          type: OrbTextType.titleSmall,
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            // 알림 설정
                                            ref
                                                .read(routerServiceProvider)
                                                .push(CrewEditRoute());
                                          },
                                          child: OrbIcon(
                                            Icons.notifications,
                                            color: context.palette.surface,
                                          ),
                                        ),
                                      ],
                                    ),
                                    OrbText(
                                      'Crew Description\nasdasd',
                                      type: OrbTextType.bodySmall,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              // 멤버 정보
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  OrbText(
                                    '멤버 21',
                                    type: OrbTextType.bodySmall,
                                    fontWeight: OrbFontWeight.medium,
                                  ),
                                  const SizedBox(width: 16),
                                  OrbText(
                                    '게시글 25',
                                    type: OrbTextType.bodySmall,
                                    fontWeight: OrbFontWeight.medium,
                                  ),
                                  const SizedBox(width: 16),
                                  OrbText(
                                    '일정 3',
                                    type: OrbTextType.bodySmall,
                                    fontWeight: OrbFontWeight.medium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const OrbRoundedContainerDivider(),
                  // 소개 섹션
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrbText(
                          '소개',
                          type: OrbTextType.titleSmall,
                          fontWeight: OrbFontWeight.medium,
                        ),
                        const SizedBox(height: 16),
                        OrbText(
                          '애니팟 사용자의 소개글 애니팟 사용자의 소개글 애니팟\nㅁㄴㅇ ㅁㄴㅇㅁㄴ',
                          type: OrbTextType.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: crewTags
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
                              '앨범 32',
                              type: OrbTextType.titleSmall,
                              fontWeight: OrbFontWeight.medium,
                            ),
                            Row(
                              children: [
                                OrbText('전체보기', type: OrbTextType.bodyMedium),
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
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: context.palette.surfaceBright,
                                borderRadius: BorderRadius.circular(8),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 크루 제목
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OrbText(
                              '크루 21',
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
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: context.palette.surfaceBright,
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
                                            '크루 이름',
                                            type: OrbTextType.bodyMedium,
                                            fontWeight: OrbFontWeight.medium,
                                          ),
                                          const SizedBox(width: 8),
                                          OrbText(
                                            '은행동',
                                            type: OrbTextType.bodySmall,
                                            color: context.palette.primary,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      OrbText(
                                        '크루 소개',
                                        type: OrbTextType.bodySmall,
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
                        // 크루 리스트
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        // 크루 리스트
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
                                  content:
                                      '게시글 내용 asdklsaj\nkla sdljkdasj kdask',
                                  commentCount: 3,
                                  likeCount: 5,
                                  imageUrl: 'https://picsum.photos/200/200',
                                  time: '1시간 전',
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
