import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../design_system/orb/orb.dart';
import '../widgets/crew_board_card.dart';

@RoutePage()
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      padding: EdgeInsets.zero,
      appBar: const OrbAppBar(
        title: '커뮤니티',
        centerTitle: true,
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            backgroundColor: context.palette.primary,
            onPressed: () {
              ref.read(routerServiceProvider).push(const PostCreateRoute());
            },
            child: OrbIcon(
              Icons.edit,
              color: context.palette.onPrimary,
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCrewSection(context),
            const OrbRoundedContainerDivider(),
            _buildCommunitySection(context),
          ],
        ),
      ),
    );
  }

  // 크루 섹션을 생성하는 함수
  Widget _buildCrewSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.palette.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCrewHeader(context),
          const SizedBox(height: 16),
          _buildCrewList(context),
        ],
      ),
    );
  }

  // 크루 섹션 헤더를 생성하는 함수
  Widget _buildCrewHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrbText(
            '죽전동',
            type: OrbTextType.bodySmall,
          ),
          const SizedBox(height: 4),
          OrbText(
            '크루로 활동하기',
            type: OrbTextType.bodyLarge,
            fontWeight: OrbFontWeight.medium,
          ),
        ],
      ),
    );
  }

  // 크루 프로필 리스트를 생성하는 함수
  Widget _buildCrewList(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 24),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                padding: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: context.palette.surfaceBright,
                      width: 2,
                    ),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    ref.read(routerServiceProvider).push(const FindCrewRoute());
                  },
                  child: CrewProfileItem(
                    isAsset: true,
                    path: 'assets/icons/crew_profile.png',
                    title: '크루 찾기',
                  ),
                ),
              ),
            ),
            CrewProfileItem(
              path: 'https://via.placeholder.com/128x128',
              title: '죽전동 공원 모임',
              onTap: () {
                ref.read(routerServiceProvider).push(const CrewProfileRoute());
              },
            ),
            CrewProfileItem(
              path: 'https://via.placeholder.com/128x128',
              title: '죽전동 공원 모임',
              onTap: () {
                ref.read(routerServiceProvider).push(const CrewProfileRoute());
              },
            ),
            CrewProfileItem(
              path: 'https://via.placeholder.com/128x128',
              title: '죽전동 공원 모임',
              onTap: () {
                ref.read(routerServiceProvider).push(const CrewProfileRoute());
              },
            ),
            CrewProfileItem(
              path: 'https://via.placeholder.com/128x128',
              title: '죽전동 공원 모임',
              onTap: () {
                ref.read(routerServiceProvider).push(const CrewProfileRoute());
              },
            ),
          ],
        ),
      );
    });
  }

  // 커뮤니티 섹션을 생성하는 함수
  Widget _buildCommunitySection(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Container(
        decoration: BoxDecoration(
          color: context.palette.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrbCategoryBar(
              currentIndex: 0,
              categoryList: const ['전체', '인기', '봉사', '리뷰', '생활'],
              onIndexChanged: (index) {},
            ),
            const SizedBox(height: 24),
            const OrbDivider(),
            ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CrewBoardCard(
                      name: '닉네임',
                      title: '게시글 제목',
                      content:
                          '게시글 내용 asdklsaj\nkla sdljkdasj kdaasdas asdlkaskl ksdsk jl',
                      commentCount: 3,
                      likeCount: 5,
                      imageUrl: 'https://picsum.photos/200/200',
                      time: '1시간 전',
                      onTap: () {
                        ref
                            .read(routerServiceProvider)
                            .push(const PostDetailRoute());
                      },
                    ),
                    const OrbDivider(),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      );
    });
  }
}

class CrewProfileItem extends StatelessWidget {
  final String path;
  final bool isAsset;
  final String title;
  final VoidCallback? onTap;

  const CrewProfileItem({
    super.key,
    this.isAsset = false,
    required this.path,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            // Circle image part
            ClipOval(
              child: isAsset
                  ? Image.asset(
                      path,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      path,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 8),
            // Title text
            OrbText(
              title,
              type: OrbTextType.bodySmall,
              fontWeight: OrbFontWeight.medium,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
