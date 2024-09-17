import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../design_system/orb/orb.dart';
import '../widgets/user_apply_status_card.dart';

@RoutePage()
class UserVolunteerScreen extends StatelessWidget {
  const UserVolunteerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categoryList = [
      '전체',
      '진행 중',
      '완료',
      '취소',
    ];

    final List<UserApplyStatus> applyStatusList = [
      UserApplyStatus(
        title: '산책 봉사활동 모집합니다',
        organization: '서울 유기견 보호센터',
        location: '강원 홍천',
        registeredDate: '2024-02-28',
        currentStep: UserApplyStatusStep.approval,
      ),
      // 다른 봉사활동 데이터 추가
    ];

    return Consumer(
      builder: (context, ref, child) {
        return OrbScaffold(
          padding: EdgeInsets.zero,
          backgroundColor: context.palette.surfaceBright,
          appBar: OrbAppBar(
            title: '봉사활동',
            centerTitle: true,
            backgroundColor: context.palette.surfaceBright,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                OrbCategoryBar(
                  currentIndex: 0,
                  categoryList: categoryList,
                  backgroundColor: context.palette.background,
                  onIndexChanged: (index) {},
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  itemCount: applyStatusList.length,
                  itemBuilder: (context, index) {
                    return UserApplyStatusCard(
                      applyStatus: applyStatusList[index],
                      onTap: () {
                        ref.read(routerServiceProvider).push(
                              UserVolunteerDetailRoute(),
                            );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
