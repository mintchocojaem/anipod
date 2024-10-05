import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_exception.dart';
import '../../../../../design_system/orb/orb.dart';
import '../../../../board/domain/models/volunteer_apply_board.dart';
import '../providers/user_apply_volunteer_provider.dart';
import '../widgets/user_apply_status_card.dart';

@RoutePage()
class UserVolunteerScreen extends StatelessWidget {
  const UserVolunteerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categoryList = VolunteerApplyStatusModel.values
        .map((e) => e.displayName)
        .toList()
      ..insert(0, '전체');

    return Consumer(
      builder: (context, ref, child) {
        final applyVolunteer = ref.watch(userApplyVolunteerProvider);

        ref.listen(
          userApplyVolunteerProvider,
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
          backgroundColor: context.palette.surfaceBright,
          appBar: OrbAppBar(
            title: '봉사활동',
            centerTitle: true,
            backgroundColor: context.palette.surfaceBright,
          ),
          body: OrbRefreshIndicator(
            onRefresh: () async {
              ref.invalidate(userApplyVolunteerProvider);
            },
            child: applyVolunteer.when(
              data: (data) {
                return SingleChildScrollView(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        itemCount: data.content.length,
                        itemBuilder: (context, index) {
                          final volunteerApplyInfo = data.content[index];
                          return UserApplyStatusCard(
                            title: volunteerApplyInfo.title,
                            organization: volunteerApplyInfo.recruitmentAgency,
                            location: volunteerApplyInfo.volunteerPlace,
                            registeredDate: volunteerApplyInfo.recruitmentPeriod
                                .split(' ~ ')[1],
                            applyStatus: volunteerApplyInfo.status,
                            onTap: () {
                              /*
                              ref.read(routerServiceProvider).push(
                                    UserVolunteerDetailRoute(),
                                  );

                               */
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              loading: () {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return OrbShimmerContent();
                  },
                );
              },
              error: (error, _) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return OrbShimmerContent();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
