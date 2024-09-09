import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class VolunteerApplyTimePicker extends StatefulWidget {
  final Function(String) onTimeSelected;

  const VolunteerApplyTimePicker({super.key, required this.onTimeSelected});

  @override
  State<VolunteerApplyTimePicker> createState() =>
      _VolunteerApplyTimePickerState();
}

class _VolunteerApplyTimePickerState extends State<VolunteerApplyTimePicker> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return OrbModalBottomSheet(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildTimeGrid(),
            const SizedBox(height: 16),
            OrbDivider(),
            const SizedBox(height: 16),
            OrbText(
              "• 선택한 봉사시간에 맞춰 도착해야 합니다.",
              type: OrbTextType.bodySmall,
            ),
            const SizedBox(height: 8),
            OrbText(
              "• 선택한 봉사시간에 맞춰 도착해야 합니다.",
              type: OrbTextType.bodySmall,
            ),
            const SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return OrbText(
      '봉사활동 시간을 선택해주세요',
      type: OrbTextType.titleSmall,
      fontWeight: OrbFontWeight.medium,
    );
  }

  Widget _buildTimeGrid() {
    final timeOptions = [
      '11:00~14:00',
      '12:00~15:00',
      '15:00~18:00',
      '18:00~21:00',
    ];

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: timeOptions.length,
      itemBuilder: (context, index) {
        final time = timeOptions[index];
        final isSelected = selectedTime == time;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTime = time;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? context.palette.primary
                  : context.palette.surfaceBright,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: OrbText(
                time,
                color: isSelected
                    ? context.palette.onPrimary
                    : context.palette.surface,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          child: OrbFilledButton(
            text: '취소',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: OrbFilledButton(
            text: '선택',
            onPressed: selectedTime != null
                ? () {
                    widget.onTimeSelected(selectedTime!);
                    Navigator.of(context).pop();
                  }
                : () {},
          ),
        ),
      ],
    );
  }
}
