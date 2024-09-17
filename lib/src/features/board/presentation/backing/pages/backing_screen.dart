import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';

@RoutePage()
class BackingScreen extends StatelessWidget {
  const BackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return OrbScaffold(
        padding: EdgeInsets.zero,
        disableSafeAreaBottom: true,
        appBar: const OrbAppBar(
          title: '봉사활동',
          centerTitle: true,
          trailing: OrbIcon(Icons.search),
        ),
        body: SingleChildScrollView(
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
                            Icons.local_fire_department_rounded,
                            color: context.palette.error,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          OrbText(
                            '기간 임박한 후원',
                            type: OrbTextType.bodyLarge,
                            fontWeight: OrbFontWeight.medium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 24),
                                width: 200,
                                height: 128,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://picsum.photos/200/300'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: context.palette.primary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                        ),
                                        child: OrbText(
                                          "D-1",
                                          type: OrbTextType.bodySmall,
                                          fontWeight: OrbFontWeight.medium,
                                          color: context.palette.onPrimary,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      OrbText(
                                        '봉사활동 제목',
                                        type: OrbTextType.bodySmall,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        color: context.palette.onPrimary,
                                      ),
                                      OrbText(
                                        '서울 유기견 보호센터\n123',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
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
                      currentIndex: 0,
                      categoryList: const ['전체', '최신', '인기', '마감 임박'],
                      onIndexChanged: (index) {},
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const OrbDivider(),
                    ListView.builder(
                        itemCount: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              ref.read(routerServiceProvider).push(
                                    BackingDetailRoute(),
                                  );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: context.palette.background,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 16),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: context
                                                    .palette.surfaceBright,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 8,
                                              right: 8,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color:
                                                      context.palette.surface,
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: OrbText(
                                                  '+1',
                                                  fontWeight:
                                                      OrbFontWeight.medium,
                                                  color:
                                                      context.palette.onSurface,
                                                  type: OrbTextType.bodySmall,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 16),
                                        // Text content section
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                child: OrbText(
                                                  "후원 내용 제목 넣기 후원\n내용 제목 넣기",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  type: OrbTextType.bodyMedium,
                                                  fontWeight:
                                                      OrbFontWeight.medium,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              OrbText(
                                                '서울 유기견 보호센터',
                                                type: OrbTextType.bodySmall,
                                                fontWeight:
                                                    OrbFontWeight.medium,
                                                color: context.palette.surface,
                                              ),
                                              OrbText(
                                                '541명이 참여하고 있어요',
                                                type: OrbTextType.bodySmall,
                                                fontWeight:
                                                    OrbFontWeight.medium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Like button and D-day section
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            OrbIcon(
                                              Icons.favorite,
                                            ),
                                            Spacer(),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      context.palette.primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: OrbText(
                                                "D-20",
                                                type: OrbTextType.bodySmall,
                                                fontWeight:
                                                    OrbFontWeight.medium,
                                                color: context.palette.primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const OrbDivider(),
                              ],
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
