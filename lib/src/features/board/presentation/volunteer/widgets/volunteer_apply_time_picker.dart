import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class VolunteerApplyTimePicker extends StatefulWidget {
  final Function(String) onTimeSelected;
  final TimeOfDay minimumTime;
  final TimeOfDay maximumTime;
  final Duration timeInterval;

  const VolunteerApplyTimePicker({
    super.key,
    required this.onTimeSelected,
    this.minimumTime = const TimeOfDay(hour: 8, minute: 0), // 기본값: 오전 8시
    this.maximumTime = const TimeOfDay(hour: 22, minute: 0), // 기본값: 오후 10시
    this.timeInterval = const Duration(hours: 1), // 기본값: 1시간 간격
  });

  @override
  State<VolunteerApplyTimePicker> createState() =>
      _VolunteerApplyTimePickerState();
}

class _VolunteerApplyTimePickerState extends State<VolunteerApplyTimePicker> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    final timeOptions = _generateTimeOptions();

    return OrbModalBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildTimeGrid(timeOptions),
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
    );
  }

  List<String> _generateTimeOptions() {
    List<String> timeOptions = [];
    DateTime startDateTime = DateTime(
      0,
      1,
      1,
      widget.minimumTime.hour,
      widget.minimumTime.minute,
    );
    DateTime endDateTime = DateTime(
      0,
      1,
      1,
      widget.maximumTime.hour,
      widget.maximumTime.minute,
    );

    DateTime currentTime = startDateTime;

    while (currentTime.isBefore(endDateTime) ||
        currentTime.isAtSameMomentAs(endDateTime)) {
      String formattedTime =
          _formatTimeOfDay(TimeOfDay.fromDateTime(currentTime));
      timeOptions.add(formattedTime);

      currentTime = currentTime.add(widget.timeInterval);
    }

    return timeOptions;
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hour;
    final minute = time.minute;
    final period = hour < 12 ? '오전' : '오후';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    final formattedMinute = minute.toString().padLeft(2, '0');

    return '$period $displayHour:$formattedMinute';
  }

  Widget _buildHeader() {
    return OrbText(
      '봉사활동 시간을 선택해주세요',
      type: OrbTextType.titleSmall,
      fontWeight: OrbFontWeight.medium,
    );
  }

  Widget _buildTimeGrid(List<String> timeOptions) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 한 줄에 3개의 시간 표시
        childAspectRatio: 2.5,
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
            backgroundColor: context.palette.secondary,
            foregroundColor: context.palette.primary,
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
              disabled: selectedTime == null,
              onPressed: () {
                if (selectedTime == null) return;
                widget.onTimeSelected(selectedTime!);
                Navigator.of(context).pop();
              }),
        ),
      ],
    );
  }
}
