import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../orb.dart'; // Orb 관련 컴포넌트 임포트

class OrbTimePicker extends StatefulWidget {
  final void Function(TimeOfDay) onTimeSelected;

  const OrbTimePicker({
    super.key,
    required this.onTimeSelected,
  });

  @override
  State<OrbTimePicker> createState() => _OrbTimePickerState();
}

class _OrbTimePickerState extends State<OrbTimePicker> {
  int selectedHour = 9;
  int selectedMinute = 0;
  bool isAm = true;

  // 1부터 12까지의 시간
  List<int> hours = List.generate(12, (index) => index + 1);
  // 0부터 59까지의 분 / 10분 단위
  List<int> minutes = List.generate(6, (index) => index * 10);

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
          // 시간 선택 UI
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // AM/PM 선택
                  Flexible(
                    flex: 1,
                    child: _buildPickerWheel(
                      palette: palette,
                      itemCount: 2,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          isAm = index == 0;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Center(
                          child: OrbText(
                            index == 0 ? '오전' : '오후',
                            type: OrbTextType.bodyLarge,
                            fontWeight: OrbFontWeight.medium,
                            color: isAm == (index == 0)
                                ? null
                                : palette.surfaceDim,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  // 시간 선택
                  Flexible(
                    flex: 1,
                    child: _buildPickerWheel(
                      palette: palette,
                      itemCount: hours.length,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedHour = hours[index];
                        });
                      },
                      itemBuilder: (context, index) {
                        return Center(
                          child: OrbText(
                            '${hours[index]}',
                            type: OrbTextType.bodyLarge,
                            fontWeight: OrbFontWeight.medium,
                            color: selectedHour == hours[index]
                                ? null
                                : palette.surfaceDim,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16,
                    child: Center(
                      child: OrbText(
                        ':',
                        type: OrbTextType.bodyLarge,
                        fontWeight: OrbFontWeight.medium,
                        color: palette.primary,
                      ),
                    ),
                  ),
                  // 분 선택
                  Flexible(
                    flex: 1,
                    child: _buildPickerWheel(
                      palette: palette,
                      itemCount: minutes.length,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedMinute = minutes[index];
                        });
                      },
                      itemBuilder: (context, index) {
                        return Center(
                          child: OrbText(
                            minutes[index].toString().padLeft(2, '0'),
                            type: OrbTextType.bodyLarge,
                            fontWeight: OrbFontWeight.medium,
                            color: selectedMinute == minutes[index]
                                ? null
                                : palette.surfaceDim,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // 확인 버튼
          OrbFilledButton(
            text: '확인',
            onPressed: () {
              int hour = isAm ? selectedHour : selectedHour + 12;
              if (hour == 12) hour = isAm ? 0 : 12; // 오전 12시는 0, 오후 12시는 12로 처리
              widget.onTimeSelected(
                  TimeOfDay(hour: hour, minute: selectedMinute));
              Navigator.of(context).pop();
            },
            backgroundColor: palette.primary,
            foregroundColor: palette.onPrimary,
          ),
        ],
      ),
    );
  }

  Widget _buildPickerWheel({
    required OrbPalette palette,
    required int itemCount,
    required Function(int) onSelectedItemChanged,
    required Widget Function(BuildContext, int) itemBuilder,
  }) {
    return Stack(
      children: [
        // 스크롤 가능한 CupertinoPicker
        SizedBox(
          height: 150,
          child: CupertinoPicker(
            itemExtent: 48,
            onSelectedItemChanged: onSelectedItemChanged,
            selectionOverlay: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: palette.primary, width: 2),
                  bottom: BorderSide(color: palette.primary, width: 2),
                ),
              ),
            ),
            children: List.generate(
                itemCount, (index) => itemBuilder(context, index)),
          ),
        ),
      ],
    );
  }
}
