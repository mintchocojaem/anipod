import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class VolunteerApplyDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const VolunteerApplyDatePicker({super.key, required this.onDateSelected});

  @override
  State<VolunteerApplyDatePicker> createState() =>
      _VolunteerApplyDatePickerState();
}

class _VolunteerApplyDatePickerState extends State<VolunteerApplyDatePicker> {
  DateTime selectedDate = DateTime.now();
  late DateTime firstDayOfMonth;
  late int daysInMonth;

  @override
  void initState() {
    super.initState();
    _updateCalendar(selectedDate);
  }

  void _updateCalendar(DateTime date) {
    firstDayOfMonth = DateTime(date.year, date.month, 1);
    daysInMonth = DateTime(date.year, date.month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    return OrbModalBottomSheet(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendarHeader(),
            _buildCalendar(),
            const SizedBox(height: 16),
            OrbDivider(),
            const SizedBox(height: 16),
            OrbText(
              "• 실제 상담일은 기관과 상담 후 변경될 수 있어요",
              type: OrbTextType.bodySmall,
            ),
            const SizedBox(height: 8),
            OrbText(
              "• 실제 상담일은 기관과 상담 후 변경될 수 있어요",
              type: OrbTextType.bodySmall,
            ),
            const SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const OrbIcon(Icons.chevron_left),
          onPressed: () {
            setState(() {
              selectedDate =
                  DateTime(selectedDate.year, selectedDate.month - 1);
              _updateCalendar(selectedDate);
            });
          },
        ),
        OrbText(
          "${selectedDate.year}년 ${selectedDate.month}월",
          type: OrbTextType.bodyLarge,
          fontWeight: OrbFontWeight.medium,
        ),
        IconButton(
          icon: const OrbIcon(Icons.chevron_right),
          onPressed: () {
            setState(() {
              selectedDate =
                  DateTime(selectedDate.year, selectedDate.month + 1);
              _updateCalendar(selectedDate);
            });
          },
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    int startWeekday = firstDayOfMonth.weekday % 7;
    DateTime prevMonth =
        DateTime(firstDayOfMonth.year, firstDayOfMonth.month - 1);
    int daysInPrevMonth = DateTime(prevMonth.year, prevMonth.month + 1, 0).day;

    return Column(
      children: [
        // 요일 표시
        Row(
          children: List.generate(
            7,
            (index) {
              return Expanded(
                child: Column(
                  children: [
                    Center(
                      child: OrbText(
                        ['일', '월', '화', '수', '목', '금', '토'][index],
                        fontWeight: OrbFontWeight.medium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const OrbDivider(),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            },
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
          ),
          itemCount: daysInMonth + startWeekday,
          itemBuilder: (context, index) {
            if (index < startWeekday) {
              // 전달의 날짜들 표시, 선택 불가능 및 테두리 없음
              int day = daysInPrevMonth - (startWeekday - index - 1);
              return Center(
                child: OrbText(
                  '$day',
                  type: OrbTextType.bodySmall,
                  color: context.palette.surfaceDim,
                ),
              );
            }

            int day = index - startWeekday + 1;
            DateTime date =
                DateTime(selectedDate.year, selectedDate.month, day);
            bool isAvailable = date.day % 2 == 0;

            return GestureDetector(
              onTap: isAvailable
                  ? () {
                      setState(() {
                        selectedDate = date;
                      });
                      widget.onDateSelected(date);
                    }
                  : null,
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: selectedDate.day == date.day
                      ? context.palette.primary
                      : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isAvailable
                        ? context.palette.primary
                        : Colors.grey, // 불가능한 날짜도 테두리 있음
                  ),
                ),
                child: Center(
                  child: OrbText(
                    '$day',
                    color: isAvailable ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            );
          },
        ),
      ],
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
              // 취소 버튼 기능
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: OrbFilledButton(
            text: '선택',
            onPressed: () async {
              // 선택 버튼 기능
              await widget.onDateSelected(selectedDate);
              if (!mounted) return;
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
