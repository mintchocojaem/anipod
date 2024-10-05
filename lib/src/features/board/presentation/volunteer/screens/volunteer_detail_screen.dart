import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../core/utils/app_exception.dart';
import '../../../../../design_system/orb/orb.dart';
import '../../../domain/models/volunteer_post_detail.dart';
import '../providers/volunteer_post_detail_provider.dart';

@RoutePage()
class VolunteerDetailScreen extends StatelessWidget {
  final String postId;

  const VolunteerDetailScreen({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildVolunteerDetailRow({
      required String label,
      required String value,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: OrbText(
                label,
                color: context.palette.surfaceDim,
                fontWeight: OrbFontWeight.medium,
              ),
            ),
            OrbText(
              value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }

    return Consumer(builder: (context, ref, child) {
      final volunteerPostDetail =
          ref.watch(volunteerPostDetailProvider(postId));

      ref.listen(
        volunteerPostDetailProvider(postId),
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
        appBar: OrbAppBar(
          title: '봉사활동 정보',
          centerTitle: true,
        ),
        body: volunteerPostDetail.when(
          skipLoadingOnReload: true,
          skipError: true,
          data: (data) {
            return OrbRefreshIndicator(
              onRefresh: () async {
                ref.invalidate(volunteerPostDetailProvider(postId));
              },
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          data.images.isEmpty
                              ? Container(
                                  height: MediaQuery.of(context).size.width,
                                  width: double.infinity,
                                  color: context.palette.surfaceBright,
                                  child: const Center(
                                    child: OrbText(
                                      '배경 이미지가 없습니다.',
                                      type: OrbTextType.bodyMedium,
                                    ),
                                  ),
                                )
                              : OrbBanner(
                                  height: MediaQuery.of(context).size.width,
                                  urls: data.images.map((e) => e.url).toList(),
                                  onTap: (index) {},
                                  onPageChanged: (index) {},
                                ),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width - 16),
                            decoration: BoxDecoration(
                              color: context.palette.background,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 32),
                                  Row(
                                    children: [
                                      OrbText(
                                        '정보',
                                        type: OrbTextType.titleSmall,
                                        fontWeight: OrbFontWeight.medium,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  buildVolunteerDetailRow(
                                    label: '봉사기간',
                                    value: data.volunteerDuration,
                                  ),
                                  const OrbDivider(),
                                  buildVolunteerDetailRow(
                                    label: '모집기간',
                                    value: data.recruitmentPeriod,
                                  ),
                                  const OrbDivider(),
                                  buildVolunteerDetailRow(
                                    label: '모집인원',
                                    value: '${data.peopleCount}명',
                                  ),
                                  const OrbDivider(),
                                  buildVolunteerDetailRow(
                                    label: '신청인원',
                                    value: '${data.applyCount}명',
                                  ),
                                  const OrbDivider(),
                                  buildVolunteerDetailRow(
                                    label: '모집기관',
                                    value: data.recruitmentAgency,
                                  ),
                                  const OrbDivider(),
                                  buildVolunteerDetailRow(
                                    label: '봉사장소',
                                    value: data.volunteerPlace,
                                  ),
                                  const OrbDivider(),
                                  buildVolunteerDetailRow(
                                    label: '봉사시간',
                                    value: data.volunteerTime,
                                  ),
                                  const OrbDivider(),
                                  buildVolunteerDetailRow(
                                    label: '활동요일',
                                    value: data.volunteerDays,
                                  ),
                                  const OrbDivider(),
                                  buildVolunteerDetailRow(
                                    label: '봉사자유형',
                                    value: data.peopleType.displayName,
                                  ),
                                  const OrbDivider(),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: OrbFilledButton(
                      text: data.status == VolunteerStatusModel.inProgress
                          ? '신청하기'
                          : '모집 완료',
                      disabled: data.status != VolunteerStatusModel.inProgress,
                      onPressed: () {
                        ref.read(routerServiceProvider).push(
                              VolunteerApplyRoute(
                                postId: postId,
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          loading: () => const Center(
            child: OrbCircularProgressIndicator(),
          ),
          error: (error, _) {
            return const Center(
              child: OrbCircularProgressIndicator(),
            );
          },
        ),
      );
    });
  }
}
