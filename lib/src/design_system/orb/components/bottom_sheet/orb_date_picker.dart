import 'package:flutter/material.dart';

import '../../orb.dart';

class OrbDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final List<String> messages;
  final List<int> unavailableDays;

  const OrbDatePicker({
    super.key,
    required this.onDateSelected,
    this.messages = const [],
    this.unavailableDays = const [],
  });

  @override
  State<OrbDatePicker> createState() => _OrbDatePickerState();
}

class _OrbDatePickerState extends State<OrbDatePicker> {
  DateTime selectedDate = DateTime.now();
  late DateTime firstDayOfMonth;
  late int daysInMonth;
  late OrbThemeData themeData;
  late OrbPalette palette;

  @override
  void initState() {
    super.initState();
    _updateCalendar(selectedDate);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeData = OrbThemeData.of(context);
    palette = themeData.palette;
  }

  void _updateCalendar(DateTime date) {
    firstDayOfMonth = DateTime(date.year, date.month, 1);
    daysInMonth = DateTime(date.year, date.month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    int startWeekday = firstDayOfMonth.weekday % 7;
    DateTime prevMonth =
        DateTime(firstDayOfMonth.year, firstDayOfMonth.month - 1);
    int daysInPrevMonth = DateTime(prevMonth.year, prevMonth.month + 1, 0).day;

    return OrbModalBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Calendar Header
          Row(
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
          ),
          const SizedBox(height: 16),

          // Day of the Week Header
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

          // Calendar Grid
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemCount: daysInMonth + startWeekday,
            itemBuilder: (context, index) {
              if (index < startWeekday) {
                int day = daysInPrevMonth - (startWeekday - index - 1);
                return Center(
                  child: OrbText(
                    '$day',
                    type: OrbTextType.bodySmall,
                    color: palette.surfaceDim,
                  ),
                );
              }

              int day = index - startWeekday + 1;
              DateTime date =
                  DateTime(selectedDate.year, selectedDate.month, day);
              bool isUnavailable = widget.unavailableDays.contains(day);

              return GestureDetector(
                onTap: !isUnavailable
                    ? () {
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    : null,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedDate.day == date.day
                        ? palette.primary
                        : palette.secondary,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: selectedDate.day == date.day
                          ? palette.primary
                          : !isUnavailable
                              ? palette.secondary
                              : palette.surface,
                    ),
                  ),
                  child: Center(
                    child: OrbText(
                      '$day',
                      color: selectedDate.day == date.day
                          ? palette.onPrimary
                          : !isUnavailable
                              ? palette.surfaceDim
                              : palette.surface,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          OrbDivider(),
          const SizedBox(height: 16),

          // Display Messages
          Column(
            children: widget.messages.map((message) {
              return Column(
                children: [
                  OrbText(
                    "• $message",
                    type: OrbTextType.bodySmall,
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // Action Buttons
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                child: OrbFilledButton(
                  backgroundColor: palette.secondary,
                  foregroundColor: palette.primary,
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
                  onPressed: () async {
                    widget.onDateSelected(selectedDate); // 확인 버튼을 눌렀을 때 날짜 선택
                    if (!mounted) return;
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
