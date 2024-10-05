import 'package:flutter/material.dart';

import '../../orb.dart';

enum OrbWeekDays {
  monday('월', 'Monday'),
  tuesday('화', 'Tuesday'),
  wednesday('수', 'Wednesday'),
  thursday('목', 'Thursday'),
  friday('금', 'Friday'),
  saturday('토', 'Saturday'),
  sunday('일', 'Sunday');

  final String displayName;
  final String value;

  const OrbWeekDays(
    this.displayName,
    this.value,
  );
}

class OrbDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final List<String> messages;
  final DateTime? selectedDate;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final List<OrbWeekDays> availableWeekDays;
  final List<DateTime> unavailableDays;

  const OrbDatePicker({
    super.key,
    required this.onDateSelected,
    this.messages = const [],
    this.selectedDate,
    this.minimumDate,
    this.maximumDate,
    this.availableWeekDays = OrbWeekDays.values,
    this.unavailableDays = const [],
  });

  @override
  State<OrbDatePicker> createState() => _OrbDatePickerState();
}

class _OrbDatePickerState extends State<OrbDatePicker> {
  late DateTime displayedMonth;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    // 선택된 날짜를 최소 날짜의 첫 번째 선택 가능한 일로 초기화
    selectedDate = widget.selectedDate ?? _getFirstSelectableDate();
    // 표시되는 월을 선택된 날짜의 월로 설정
    displayedMonth = DateTime(selectedDate.year, selectedDate.month, 1);
  }

  DateTime _getFirstSelectableDate() {
    DateTime date = widget.minimumDate ?? DateTime.now();
    while (true) {
      // 날짜가 범위 내에 있고, 사용 가능한 요일이며, 제외된 날짜가 아닌지 확인
      if (_isInRange(date) &&
          _isWeekdayAvailable(date) &&
          !_isDayUnavailable(date)) {
        return date;
      }
      date = date.add(const Duration(days: 1));
      // 최대 날짜를 넘어가면 루프 종료
      if (widget.maximumDate != null && date.isAfter(widget.maximumDate!)) {
        break;
      }
    }
    // 선택 가능한 날짜가 없으면 최소 날짜나 현재 날짜 반환
    return date;
  }

  bool _isWeekdayAvailable(DateTime date) {
    // 요일이 availableWeekDays에 포함되어 있는지 확인
    return widget.availableWeekDays.any(
        (availableWeekDay) => (availableWeekDay.index + 1) == date.weekday);
  }

  bool _isDayUnavailable(DateTime date) {
    // unavailableDays에 포함된 날짜인지 확인
    return widget.unavailableDays.any((unavailableDay) =>
        unavailableDay.year == date.year &&
        unavailableDay.month == date.month &&
        unavailableDay.day == date.day);
  }

  bool _isInRange(DateTime date) {
    return (widget.minimumDate == null ||
            !date.isBefore(widget.minimumDate!)) &&
        (widget.maximumDate == null || !date.isAfter(widget.maximumDate!));
  }

  @override
  Widget build(BuildContext context) {
    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;

    // 해당 월의 첫 번째 날짜와 마지막 날짜
    DateTime firstDayOfMonth =
        DateTime(displayedMonth.year, displayedMonth.month, 1);
    int firstWeekday = firstDayOfMonth.weekday % 7; // 일요일=0, 월요일=1, ..., 토요일=6

    // 달력에 표시할 총 셀 수 (6주 x 7일 = 42)
    int totalItemCount = 6 * 7;

    return OrbModalBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 달력 헤더
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const OrbIcon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    displayedMonth = DateTime(
                      displayedMonth.year,
                      displayedMonth.month - 1,
                      1,
                    );
                  });
                },
              ),
              OrbText(
                "${displayedMonth.year}년 ${displayedMonth.month}월",
                type: OrbTextType.bodyLarge,
                fontWeight: OrbFontWeight.medium,
              ),
              IconButton(
                icon: const OrbIcon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    displayedMonth = DateTime(
                      displayedMonth.year,
                      displayedMonth.month + 1,
                      1,
                    );
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 요일 헤더
          Row(
            children: List.generate(
              7,
              (index) {
                return Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: OrbText(
                          OrbWeekDays.values
                              .map((e) => e.displayName)
                              .toList()[index],
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
          // 달력 그리드
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalItemCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              // 달력에 표시될 날짜 계산
              int dayOffset = index - firstWeekday;
              DateTime date = DateTime(
                  displayedMonth.year, displayedMonth.month, dayOffset + 1);

              // 현재 월인지 확인
              bool isCurrentMonth = date.month == displayedMonth.month;

              // 날짜가 범위 내에 있는지 확인
              bool isInRange = _isInRange(date);
              bool isWeekdayAvailable = _isWeekdayAvailable(date);
              bool isDayUnavailable = _isDayUnavailable(date);
              bool isSelectable = isCurrentMonth &&
                  isInRange &&
                  isWeekdayAvailable &&
                  !isDayUnavailable;

              // 선택된 날짜인지 확인
              bool isSelected = selectedDate.year == date.year &&
                  selectedDate.month == date.month &&
                  selectedDate.day == date.day;

              return GestureDetector(
                onTap: isSelectable
                    ? () {
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    : null,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isSelected ? palette.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: isSelectable
                        ? Border.all(
                            color: isSelected
                                ? palette.primary
                                : palette.surfaceDim,
                          )
                        : null,
                  ),
                  child: Center(
                    child: OrbText(
                      '${date.day}',
                      color: isSelectable
                          ? (isSelected
                              ? palette.onPrimary
                              : palette.surfaceDim)
                          : palette.surface,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          const OrbDivider(),
          const SizedBox(height: 16),
          // 메시지 표시
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.messages.map((message) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: OrbText(
                  "• $message",
                  type: OrbTextType.bodySmall,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          // 버튼
          Row(
            children: [
              Expanded(
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
              Expanded(
                child: OrbFilledButton(
                  text: '선택',
                  onPressed: () {
                    widget.onDateSelected(selectedDate);
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
