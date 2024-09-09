import 'package:anipod/src/core/services/router/router_service.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:anipod/src/features/board/presentation/volunteer/widgets/guide_card.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.gr.dart';
import '../widgets/volunteer_list_item.dart';

@RoutePage()
class VolunteerScreen extends StatelessWidget {
  const VolunteerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return OrbScaffold(
        padding: EdgeInsets.zero,
        appBar: const OrbAppBar(
          title: '봉사활동',
          centerTitle: true,
          trailing: OrbIcon(Icons.search),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          GuideCard(
                            content: "초보자를 위한 봉사활동 가이드",
                            icon: Icon(
                              Icons.gpp_good_outlined,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GuideCard(
                            content: "초보자를 위한 봉사활동 가이드",
                            icon: Icon(
                              Icons.gpp_good_outlined,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GuideCard(
                            content: "초보자를 위한 봉사활동 가이드",
                            icon: Icon(
                              Icons.gpp_good_outlined,
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 56,
                    color: context.palette.surfaceBright,
                  ),
                  Positioned.fill(
                    top: 0,
                    bottom: 32,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.palette.background,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 32,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.palette.background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.palette.background,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrbCategoryBar(
                      currentIndex: 0,
                      categoryList: const ['전체', '최신순', '인기순'],
                      onIndexChanged: (index) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const OrbDivider(),
                    ListView.builder(
                        itemCount: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              VolunteerListItem(
                                title: '봉사활동 제목',
                                organization: '서울 유기견 보호센터',
                                region: '강원 춘천',
                                registrationDate: '2021.09.01',
                                photos: const [],
                                isLiked: false,
                                duration: 'D-3',
                                onTap: () {
                                  ref.read(routerServiceProvider).push(
                                        VolunteerDetailRoute(),
                                      );
                                },
                              ),
                              const OrbDivider(),
                            ],
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
