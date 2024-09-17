import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../../../../design_system/orb/orb.dart';

class Schedule {
  final DateTime date;
  final TimeOfDay time;
  final int participants;

  Schedule({
    required this.date,
    required this.time,
    required this.participants,
  });
}

class ScheduleCreator extends HookWidget {
  final void Function(Schedule newSchedule) onScheduleCreated;

  const ScheduleCreator({
    super.key,
    required this.onScheduleCreated,
  });

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState<DateTime?>(null);
    final selectedTime = useState<TimeOfDay?>(null);
    final participantsNumber = useState<int?>(null);
    final bool isButtonEnabled = selectedDate.value != null &&
        selectedTime.value != null &&
        participantsNumber.value != null;
    return OrbScaffold(
      appBar: OrbAppBar(
        title: '일정 추가',
        centerTitle: true,
        trailing: IconButton(
          icon: OrbIcon(
            Icons.check_rounded,
            color: context.palette.primary,
          ),
          onPressed: isButtonEnabled
              ? () {
                  onScheduleCreated(
                    Schedule(
                      date: selectedDate.value!,
                      time: selectedTime.value!,
                      participants: participantsNumber.value ?? 0,
                    ),
                  );
                  Navigator.of(context).pop();
                }
              : null,
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              showOrbModalBottomSheet(
                context,
                OrbDatePicker(
                  onDateSelected: (date) {
                    selectedDate.value = date;
                  },
                  messages: [
                    '실제 상담일은 기관과 상담 후 변경될 수 있어요',
                    '실제 상담일은 기관과 상담 후 변경될 수 있어요',
                  ],
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OrbIcon(
                        Icons.calendar_today_outlined,
                        size: OrbIconSize.small,
                      ),
                      const SizedBox(width: 8),
                      OrbText(
                        selectedDate.value == null
                            ? '날짜'
                            : DateFormat('yyyy년 MM월 dd일')
                                .format(selectedDate.value!),
                        type: OrbTextType.bodyLarge,
                        fontWeight: OrbFontWeight.medium,
                        color: context.palette.surface,
                      ),
                    ],
                  ),
                ),
                OrbDivider(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showOrbModalBottomSheet(
                context,
                OrbTimePicker(
                  onTimeSelected: (time) {
                    selectedTime.value = time;
                  },
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OrbIcon(
                        Icons.access_time_outlined,
                        size: OrbIconSize.small,
                      ),
                      const SizedBox(width: 8),
                      OrbText(
                        selectedTime.value == null
                            ? '시간'
                            : selectedTime.value!.format(context),
                        type: OrbTextType.bodyLarge,
                        fontWeight: OrbFontWeight.medium,
                        color: context.palette.surface,
                      ),
                    ],
                  ),
                ),
                OrbDivider(),
              ],
            ),
          ),
          Row(
            children: [
              OrbIcon(
                Icons.people_alt_outlined,
                size: OrbIconSize.small,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    participantsNumber.value = int.tryParse(value) ?? 0;
                  },
                  decoration: InputDecoration(
                    hintText: '참여 인원(명)',
                    hintStyle: context.theme.textTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.palette.surfaceDim,
                    ),
                    counterText: '',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  style: context.theme.textTheme.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.palette.surface,
                  ),
                  maxLines: 1,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          OrbDivider(),
        ],
      ),
    );
  }
}
