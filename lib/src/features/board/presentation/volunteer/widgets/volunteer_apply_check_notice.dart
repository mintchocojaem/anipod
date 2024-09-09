import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class VolunteerApplyCheckNotice extends StatefulWidget {
  final Function(bool) onNoticeChecked;

  const VolunteerApplyCheckNotice({super.key, required this.onNoticeChecked});

  @override
  State<VolunteerApplyCheckNotice> createState() =>
      _VolunteerApplyCheckNoticeState();
}

class _VolunteerApplyCheckNoticeState extends State<VolunteerApplyCheckNotice> {
  bool isAllChecked = false;
  List<bool> noticesChecked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return OrbModalBottomSheet(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            _buildNoticeItems(),
            const SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAllChecked = !isAllChecked;
          noticesChecked =
              List<bool>.filled(noticesChecked.length, isAllChecked);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.palette.surface,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              Icons.check_rounded,
              color: isAllChecked ? context.palette.primary : Colors.grey,
            ),
            const SizedBox(width: 8),
            const OrbText(
              '전체 동의하기',
              type: OrbTextType.bodyLarge,
              fontWeight: OrbFontWeight.medium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoticeItems() {
    final noticeItems = [
      '개인정보 수집 및 이용 동의',
      '개인정보 제공 안내',
      '개인정보 제공 안내',
    ];

    return Column(
      children: List.generate(noticeItems.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              noticesChecked[index] = !noticesChecked[index];
              if (!noticesChecked.contains(false)) {
                isAllChecked = true;
              } else {
                isAllChecked = false;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.check_rounded,
                  color: noticesChecked[index]
                      ? context.palette.primary
                      : Colors.grey,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OrbText(
                    noticeItems[index],
                  ),
                ),
                OrbIcon(
                  Icons.chevron_right_rounded,
                  color: context.palette.surfaceDim,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        OrbFilledButton(
          text: '확인',
          disabled: noticesChecked.contains(false),
          onPressed: noticesChecked.contains(false)
              ? () {}
              : () {
                  widget.onNoticeChecked(isAllChecked);
                  Navigator.of(context).pop();
                },
        ),
      ],
    );
  }
}
