import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class UserVolunteerDetailScreen extends StatelessWidget {
  const UserVolunteerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final selectedDate = useState<DateTime?>(DateTime.now());
      final selectedTime = useState<String?>("오전 10시");
      final isAllChecked = useState(true);

      return OrbScaffold(
        padding: EdgeInsets.zero,
        backgroundColor: context.palette.surfaceBright,
        appBar: OrbAppBar(
          title: '신청현황',
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: context.palette.background,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: OrbText(
                              '봉사활동이 현재\n승인된 상태입니다',
                              type: OrbTextType.titleSmall,
                              fontWeight: OrbFontWeight.medium,
                            ),
                          ),
                          /*
                          UserApplyStatusCard(
                            applyStatus: applyStatusList[0],
                            onTap: () {},
                           */
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.palette.background,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrbText(
                              '신청자 정보',
                              type: OrbTextType.titleSmall,
                              fontWeight: OrbFontWeight.medium,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: OrbTextField(
                                    hintText: '이름',
                                    readOnly: true,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: OrbTextField(
                                    hintText: '생년월일',
                                    readOnly: true,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            OrbTextField(
                              hintText: '전화번호',
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildAdditionalInfoSection(
                      context,
                      selectedDate,
                      selectedTime,
                      isAllChecked,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OrbFilledButton(
                      text: '취소하기',
                      backgroundColor: context.palette.secondary,
                      foregroundColor: context.palette.primary,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OrbFilledButton(
                      text: '문의하기',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
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
    return Row(
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
      ],
    );
  }

  Widget _buildTimeRow(
    BuildContext context,
    ValueNotifier<String?> selectedTime,
  ) {
    return Row(
      children: [
        OrbText(
          '봉사시간 선택',
          type: OrbTextType.bodyLarge,
          fontWeight: OrbFontWeight.medium,
        ),
        const Spacer(),
        if (selectedTime.value != null) OrbText(selectedTime.value!),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSelectableRow({
    required BuildContext context,
    required ValueNotifier<bool> isAllChecked,
  }) {
    return Row(
      children: [
        OrbText(
          '유의사항 확인',
          type: OrbTextType.bodyLarge,
          fontWeight: OrbFontWeight.medium,
        ),
        const Spacer(),
        if (isAllChecked.value) OrbText('동의 완료'),
        const SizedBox(width: 8),
      ],
    );
  }
}
