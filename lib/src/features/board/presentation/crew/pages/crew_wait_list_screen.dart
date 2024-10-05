import 'package:anipod/src/core/utils/date_time_formatter.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_exception.dart';
import '../../../../../design_system/orb/orb.dart';
import '../providers/crew_wait_list_provider.dart';

@RoutePage()
class CrewWaitListScreen extends StatelessWidget with DateTimeFormatter {
  final String crewId;

  const CrewWaitListScreen({
    super.key,
    required this.crewId,
  });

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      backgroundColor: context.palette.surfaceBright,
      appBar: OrbAppBar(
        title: '크루 대기 목록',
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final crewWaitList = ref.watch(crewWaitListProvider(crewId));

          ref.listen(crewWaitListProvider(crewId), (_, next) {
            if (!next.isLoading && next.hasError) {
              final error = next.error;
              if (error is! AppException) return;
              context.showErrorSnackBar(
                error: error,
              );
            }
          });

          return OrbRefreshIndicator(
            onRefresh: () async {
              ref.invalidate(crewWaitListProvider(crewId));
            },
            child: crewWaitList.when(
              skipLoadingOnReload: true,
              data: (data) {
                return ListView.builder(
                  itemCount: data.content.length,
                  padding: const EdgeInsets.only(top: 24),
                  itemBuilder: (context, index) {
                    final item = data.content[index];
                    return Container(
                      padding: const EdgeInsets.all(24),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: context.palette.background,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: context.palette.surfaceBright,
                                child: OrbIcon(
                                  Icons.person,
                                  color: context.palette.surface,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: OrbText(
                                            item.nickname,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            type: OrbTextType.bodyLarge,
                                            fontWeight: OrbFontWeight.medium,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: context.palette.secondary,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: OrbText(
                                            item.depositStatus,
                                            color: context.palette.primary,
                                            fontWeight: OrbFontWeight.medium,
                                            type: OrbTextType.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                    OrbText(
                                      '${item.gender} / ${item.age}',
                                      type: OrbTextType.bodySmall,
                                      fontWeight: OrbFontWeight.medium,
                                      color: context.palette.surfaceDim,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                                child: OrbText(
                                  '지역',
                                  color: context.palette.surface,
                                  fontWeight: OrbFontWeight.medium,
                                  type: OrbTextType.bodySmall,
                                ),
                              ),
                              OrbText(
                                item.town,
                                color: context.palette.surfaceDim,
                                fontWeight: OrbFontWeight.medium,
                                type: OrbTextType.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                                child: OrbText(
                                  '신청일',
                                  color: context.palette.surface,
                                  fontWeight: OrbFontWeight.medium,
                                  type: OrbTextType.bodySmall,
                                ),
                              ),
                              OrbText(
                                dateFormatToCompact(item.applyDate),
                                color: context.palette.surfaceDim,
                                fontWeight: OrbFontWeight.medium,
                                type: OrbTextType.bodySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OrbFilledButton(
                                  text: '거절하기',
                                  buttonTextType: OrbButtonTextType.medium,
                                  backgroundColor: context.palette.secondary,
                                  foregroundColor: context.palette.primary,
                                  buttonSize: OrbButtonSize.fit,
                                  buttonRadius: OrbButtonRadius.small,
                                  onPressed: () {
                                    ref
                                        .read(crewWaitListProvider(crewId)
                                            .notifier)
                                        .rejectJoinRequest(
                                          userId: item.crewMemberId,
                                        );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: OrbFilledButton(
                                  text: '승인하기',
                                  buttonTextType: OrbButtonTextType.medium,
                                  buttonSize: OrbButtonSize.fit,
                                  buttonRadius: OrbButtonRadius.small,
                                  onPressed: () {
                                    ref
                                        .read(crewWaitListProvider(crewId)
                                            .notifier)
                                        .approveJoinRequest(
                                          userId: item.crewMemberId,
                                        );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
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
          );
        },
      ),
    );
  }
}
