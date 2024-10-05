import 'package:anipod/src/core/utils/app_exception.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../design_system/orb/orb.dart';
import '../providers/volunteer_post_detail_provider.dart';
import '../widgets/volunteer_apply_check_notice.dart';
import '../widgets/volunteer_apply_time_picker.dart';

@RoutePage()
class VolunteerApplyScreen extends StatelessWidget {
  final String postId;

  const VolunteerApplyScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      backgroundColor: context.palette.surfaceBright,
      padding: EdgeInsets.zero,
      appBar: OrbAppBar(
        title: '신청하기',
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final volunteerPostDetail =
              ref.watch(volunteerPostDetailProvider(postId));

          return volunteerPostDetail.when(
            skipLoadingOnReload: true,
            skipError: true,
            data: (postDetail) {
              return HookBuilder(
                builder: (context) {
                  final nameController = useTextEditingController();
                  final birthController = useTextEditingController();
                  final phoneController = useTextEditingController();

                  // 상태를 Hook으로 관리
                  final selectedDate = useState<DateTime?>(null);
                  final selectedTime = useState<String?>(null);
                  final isAllChecked = useState<bool>(false);

                  final isUserInfoFilled = useState<bool>(false);

                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(16),
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: context.palette.background,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OrbText(
                                      '애니팟으로 간편하게\n봉사활동 신청 완료하기!',
                                      type: OrbTextType.titleSmall,
                                      fontWeight: OrbFontWeight.medium,
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: context.palette.secondary,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: context.palette.surface,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image:
                                                  postDetail.images.isNotEmpty
                                                      ? DecorationImage(
                                                          image: NetworkImage(
                                                            postDetail.images
                                                                .first.url,
                                                          ),
                                                          fit: BoxFit.cover,
                                                          onError: (exception,
                                                              stackTrace) {
                                                            print(
                                                                'Image loading error: $exception');
                                                          },
                                                        )
                                                      : null,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                OrbText(
                                                  postDetail.title,
                                                  type: OrbTextType.bodyMedium,
                                                  fontWeight:
                                                      OrbFontWeight.medium,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 4),
                                                _buildDetailRow(
                                                    '단체명',
                                                    postDetail
                                                        .recruitmentAgency,
                                                    context),
                                                _buildDetailRow(
                                                    '봉사장소',
                                                    postDetail.volunteerPlace,
                                                    context),
                                                _buildDetailRow(
                                                    '모집 미김일',
                                                    postDetail.recruitmentPeriod
                                                        .split(' ~ ')[1],
                                                    context),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 8),
                                child: OrbText(
                                  '신청 정보 작성하기',
                                  type: OrbTextType.titleSmall,
                                  fontWeight: OrbFontWeight.medium,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: context.palette.background,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    OrbText(
                                      '신청자 정보',
                                      type: OrbTextType.titleSmall,
                                      fontWeight: OrbFontWeight.medium,
                                    ),
                                    const SizedBox(height: 16),
                                    Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          child: OrbTextField(
                                            controller: nameController,
                                            hintText: '이름',
                                            textInputAction:
                                                TextInputAction.next,
                                            onChanged: (value) {
                                              isUserInfoFilled.value =
                                                  nameController
                                                          .text.isNotEmpty &&
                                                      birthController
                                                          .text.isNotEmpty &&
                                                      phoneController
                                                          .text.isNotEmpty;
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Flexible(
                                          flex: 7,
                                          child: OrbTextField(
                                            controller: birthController,
                                            hintText: '생년월일(예: 19990129)',
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              isUserInfoFilled.value =
                                                  nameController
                                                          .text.isNotEmpty &&
                                                      birthController
                                                          .text.isNotEmpty &&
                                                      phoneController
                                                          .text.isNotEmpty;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    OrbTextField(
                                      controller: phoneController,
                                      hintText: '전화번호',
                                      keyboardType: TextInputType.phone,
                                      textInputAction: TextInputAction.done,
                                      onChanged: (value) {
                                        isUserInfoFilled.value = nameController
                                                .text.isNotEmpty &&
                                            birthController.text.isNotEmpty &&
                                            phoneController.text.isNotEmpty;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: context.palette.background,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showOrbModalBottomSheet(
                                          context,
                                          OrbDatePicker(
                                            onDateSelected: (date) {
                                              selectedDate.value = date;
                                            },
                                            selectedDate: selectedDate.value,
                                            minimumDate:
                                                DateFormat('yyyy.MM.dd').parse(
                                              postDetail.recruitmentPeriod
                                                  .split(' ~ ')[0],
                                            ),
                                            maximumDate:
                                                DateFormat('yyyy.MM.dd').parse(
                                              postDetail.recruitmentPeriod
                                                  .split(' ~ ')[1],
                                            ),
                                            availableWeekDays: postDetail
                                                .volunteerDays
                                                .split(', ')
                                                .map((day) => OrbWeekDays.values
                                                    .firstWhere((element) =>
                                                        element.displayName ==
                                                        day))
                                                .toList(),
                                            messages: [
                                              '실제 상담일은 기관과 상담 후 변경될 수 있어요',
                                            ],
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          OrbText(
                                            '봉사희망 날짜',
                                            type: OrbTextType.bodyLarge,
                                            fontWeight: OrbFontWeight.medium,
                                          ),
                                          const Spacer(),
                                          if (selectedDate.value != null)
                                            OrbText(
                                              DateFormat('yyyy. MM. dd')
                                                  .format(selectedDate.value!),
                                            ),
                                          const SizedBox(width: 8),
                                          OrbIcon(
                                            Icons.chevron_right_rounded,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    OrbDivider(),
                                    const SizedBox(height: 16),
                                    InkWell(
                                      onTap: () {
                                        showOrbModalBottomSheet(
                                          context,
                                          VolunteerApplyTimePicker(
                                            minimumTime: TimeOfDay(
                                              hour: 12,
                                              minute: 0,
                                            ),
                                            maximumTime: TimeOfDay(
                                              hour: 18,
                                              minute: 0,
                                            ),
                                            onTimeSelected: (time) {
                                              selectedTime.value = time;
                                            },
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          OrbText(
                                            '봉사시간 선택',
                                            type: OrbTextType.bodyLarge,
                                            fontWeight: OrbFontWeight.medium,
                                          ),
                                          const Spacer(),
                                          if (selectedTime.value != null)
                                            OrbText(selectedTime.value!),
                                          const SizedBox(width: 8),
                                          OrbIcon(
                                            Icons.chevron_right_rounded,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    OrbDivider(),
                                    const SizedBox(height: 16),
                                    _buildSelectableRow(
                                      context: context,
                                      isAllChecked: isAllChecked,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: OrbFilledButton(
                          text: '신청하기',
                          disabled: !isUserInfoFilled.value ||
                              selectedDate.value == null ||
                              selectedTime.value == null ||
                              !isAllChecked.value,
                          onPressed: () async {
                            final isBirthValid = RegExp(
                              r'^[0-9]{4}[0-1][0-9][0-3][0-9]$',
                            ).hasMatch(birthController.text);

                            if (!isBirthValid) {
                              context.showErrorSnackBar(
                                error: AppWarning(
                                  message: '생년월일을 정확히 입력해주세요.',
                                  stackTrace: StackTrace.current,
                                ),
                              );
                              return;
                            }

                            final phone = phoneController.text.replaceAllMapped(
                              RegExp(r'^(\d{3})(\d{4})(\d{4})$'),
                              (match) => '${match[1]}-${match[2]}-${match[3]}',
                            );

                            final result = await ref
                                .read(volunteerPostDetailProvider(postId)
                                    .notifier)
                                .apply(
                                  userName: nameController.text,
                                  birthDate: DateFormat('yyyy-MM-dd').format(
                                      DateTime.parse(birthController.text)),
                                  phone: phone,
                                  hopeDate: DateFormat('yyyy-MM-dd')
                                      .format(selectedDate.value!),
                                  hopeTime: selectedTime.value!,
                                );

                            if (result) {
                              ref
                                  .read(routerServiceProvider)
                                  .replace(const VolunteerApplyCompleteRoute());
                            }
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            loading: () => const Center(
              child: OrbCircularProgressIndicator(),
            ),
            error: (error, stackTrace) => const Center(
              child: OrbCircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 64,
          child: OrbText(
            label,
            type: OrbTextType.bodySmall,
            fontWeight: OrbFontWeight.medium,
            color: context.palette.surfaceDim,
          ),
        ),
        OrbText(
          value,
          type: OrbTextType.bodySmall,
          fontWeight: OrbFontWeight.medium,
        ),
      ],
    );
  }

  Widget _buildSelectableRow({
    required BuildContext context,
    required ValueNotifier<bool> isAllChecked,
  }) {
    return InkWell(
      onTap: () {
        showOrbModalBottomSheet(
          context,
          VolunteerApplyCheckNotice(
            onNoticeChecked: (checked) {
              isAllChecked.value = checked;
            },
          ),
        );
      },
      child: Row(
        children: [
          OrbText(
            '유의사항 확인',
            type: OrbTextType.bodyLarge,
            fontWeight: OrbFontWeight.medium,
          ),
          const Spacer(),
          if (isAllChecked.value) OrbText('동의 완료'),
          const SizedBox(width: 8),
          OrbIcon(
            Icons.chevron_right_rounded,
          ),
        ],
      ),
    );
  }
}
