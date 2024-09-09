import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../design_system/orb/orb.dart';
import '../widgets/volunteer_apply_check_notice.dart';
import '../widgets/volunteer_apply_date_picker.dart';
import '../widgets/volunteer_apply_time_picker.dart';

@RoutePage()
class VolunteerApplyScreen extends StatelessWidget {
  const VolunteerApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      backgroundColor: context.palette.surfaceBright,
      padding: EdgeInsets.zero,
      appBar: OrbAppBar(
        title: '신청하기',
        centerTitle: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        return HookBuilder(
          builder: (context) {
            // 상태를 Hook으로 관리
            final selectedDate = useState<DateTime?>(null);
            final selectedTime = useState<String?>(null);
            final isAllChecked = useState<bool>(false);
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderSection(context),
                        const SizedBox(height: 8),
                        _buildSectionTitle('신청 정보 작성하기'),
                        const SizedBox(height: 8),
                        _buildApplicantInfoSection(context),
                        const SizedBox(height: 16),
                        _buildAdditionalInfoSection(
                          context,
                          selectedDate,
                          selectedTime,
                          isAllChecked,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: OrbFilledButton(
                    text: '신청하기',
                    onPressed: () {
                      ref
                          .read(routerServiceProvider)
                          .push(const VolunteerApplyCompleteRoute());
                    },
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
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
            type: OrbTextType.titleMedium,
            fontWeight: OrbFontWeight.medium,
          ),
          const SizedBox(height: 16),
          _buildVolunteerActivityCard(context),
        ],
      ),
    );
  }

  Widget _buildVolunteerActivityCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.palette.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://via.placeholder.com/150',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrbText(
                  '산책 봉사활동 모집합니다22222',
                  type: OrbTextType.bodyMedium,
                  fontWeight: OrbFontWeight.medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                _buildDetailRow('단체명', '서울 동물보호협회', context),
                _buildDetailRow('지역', '강원 홍천', context),
                _buildDetailRow('등록일', '2024-02-28', context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 48,
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: OrbText(
        title,
        type: OrbTextType.titleSmall,
        fontWeight: OrbFontWeight.medium,
      ),
    );
  }

  Widget _buildApplicantInfoSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
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
                child: OrbTextField(
                  hintText: '이름',
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: OrbTextField(
                  hintText: '생년월일',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          OrbTextField(
            hintText: '전화번호를 입력해주세요',
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfoSection(
    BuildContext context,
    ValueNotifier<DateTime?> selectedDate,
    ValueNotifier<String?> selectedTime,
    ValueNotifier<bool> isAllChecked,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.palette.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateRow(context, selectedDate),
          const SizedBox(height: 16),
          OrbDivider(),
          const SizedBox(height: 16),
          _buildTimeRow(context, selectedTime),
          const SizedBox(height: 16),
          OrbDivider(),
          const SizedBox(height: 16),
          _buildSelectableRow(
            context: context,
            isAllChecked: isAllChecked,
          ),
        ],
      ),
    );
  }

  Widget _buildDateRow(
    BuildContext context,
    ValueNotifier<DateTime?> selectedDate,
  ) {
    return InkWell(
      onTap: () {
        showOrbModalBottomSheet(
          context,
          VolunteerApplyDatePicker(
            onDateSelected: (date) {
              selectedDate.value = date;
            },
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
              '${selectedDate.value!.year}. ${selectedDate.value!.month.toString().padLeft(2, '0')}. ${selectedDate.value!.day.toString().padLeft(2, '0')}',
            ),
          const SizedBox(width: 8),
          OrbIcon(
            Icons.chevron_right_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow(
    BuildContext context,
    ValueNotifier<String?> selectedTime,
  ) {
    return InkWell(
      onTap: () {
        showOrbModalBottomSheet(
          context,
          VolunteerApplyTimePicker(
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
          if (selectedTime.value != null) OrbText(selectedTime.value!),
          const SizedBox(width: 8),
          OrbIcon(
            Icons.chevron_right_rounded,
          ),
        ],
      ),
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
