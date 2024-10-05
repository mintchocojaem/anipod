import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../orb.dart'; // Orb 관련 컴포넌트 임포트

class OrbTimePicker extends StatefulWidget {
  final void Function(TimeOfDay) onTimeSelected;
  final TimeOfDay? minimumTime;
  final TimeOfDay? maximumTime;
  final Duration timeInterval;

  const OrbTimePicker({
    super.key,
    required this.onTimeSelected,
    this.minimumTime,
    this.maximumTime,
    this.timeInterval = const Duration(minutes: 10),
  });

  @override
  State<OrbTimePicker> createState() => _OrbTimePickerState();
}

class _OrbTimePickerState extends State<OrbTimePicker> {
  late List<TimeOfDay> timeOptions;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _generateTimeOptions();
  }

  void _generateTimeOptions() {
    TimeOfDay startTime =
        widget.minimumTime ?? const TimeOfDay(hour: 0, minute: 0);
    TimeOfDay endTime =
        widget.maximumTime ?? const TimeOfDay(hour: 23, minute: 59);

    List<TimeOfDay> times = [];
    DateTime startDateTime =
        DateTime(0, 1, 1, startTime.hour, startTime.minute);
    DateTime endDateTime = DateTime(0, 1, 1, endTime.hour, endTime.minute);

    while (startDateTime.isBefore(endDateTime) ||
        startDateTime.isAtSameMomentAs(endDateTime)) {
      times.add(
          TimeOfDay(hour: startDateTime.hour, minute: startDateTime.minute));
      startDateTime = startDateTime.add(widget.timeInterval);
    }

    timeOptions = times;
  }

  @override
  Widget build(BuildContext context) {
    OrbPalette palette = OrbThemeData.of(context).palette;

    return OrbModalBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OrbText(
            '시간 설정',
            type: OrbTextType.titleSmall,
            fontWeight: OrbFontWeight.medium,
          ),
          const SizedBox(height: 16),
          // 시간 선택 UI
          Expanded(
            child: CupertinoPicker(
              itemExtent: 48,
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectionOverlay: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: palette.primary, width: 2),
                    bottom: BorderSide(color: palette.primary, width: 2),
                  ),
                ),
              ),
              children: List.generate(
                timeOptions.length,
                (index) {
                  TimeOfDay time = timeOptions[index];
                  String formattedTime = time.format(context);
                  return Center(
                    child: OrbText(
                      formattedTime,
                      type: OrbTextType.bodyLarge,
                      fontWeight: OrbFontWeight.medium,
                      color: selectedIndex == index ? null : palette.surfaceDim,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 32),
          // 확인 버튼
          OrbFilledButton(
            text: '확인',
            onPressed: () {
              widget.onTimeSelected(timeOptions[selectedIndex]);
              Navigator.of(context).pop();
            },
            backgroundColor: palette.primary,
            foregroundColor: palette.onPrimary,
          ),
        ],
      ),
    );
  }
}
