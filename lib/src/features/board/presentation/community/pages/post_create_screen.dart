import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../design_system/orb/orb.dart';
import '../widgets/post_tag_picker.dart';
import '../widgets/schedule_creator.dart';

@RoutePage()
class PostCreateScreen extends StatelessWidget {
  const PostCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tags = [];
    return OrbScaffold(
      disableSafeAreaBottom: true,
      appBar: OrbAppBar(
        title: '글쓰기',
        centerTitle: true,
        trailing: IconButton(
          icon: OrbIcon(
            Icons.send,
            color: context.palette.primary,
          ),
          onPressed: () {},
        ),
      ),
      body: HookBuilder(builder: (context) {
        final schedule = useState<Schedule?>(null);
        return Consumer(
          builder: (context, ref, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tags.isEmpty
                      ? InkWell(
                          onTap: () {
                            showOrbModalBottomSheet(
                              context,
                              PostTagPicker(),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    OrbIcon(
                                      Icons.tag_rounded,
                                      size: OrbIconSize.small,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: OrbText(
                                        '태그 추가',
                                        type: OrbTextType.bodyLarge,
                                        fontWeight: OrbFontWeight.medium,
                                        color: context.palette.surface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              OrbDivider(),
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            const SizedBox(width: 16),
                            Expanded(
                              child: Wrap(
                                spacing: 8,
                                children: [
                                  for (final tag in tags)
                                    PostTagItem(
                                      tag: tag,
                                      onDelete: () {
                                        tags.remove(tag);
                                      },
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                  OrbTextField(
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                    hintText: '제목을 입력해주세요',
                    maxLines: 1,
                    maxLength: 50,
                    style: OrbTextType.titleSmall,
                    fillColor: Colors.transparent,
                    boarderColor: Colors.transparent,
                  ),
                  OrbDivider(),
                  OrbTextField(
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                    hintText: '내용을 입력해주세요',
                    style: OrbTextType.bodyLarge,
                    fillColor: Colors.transparent,
                    boarderColor: Colors.transparent,
                    maxLines: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //image picker
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: context.palette.surfaceBright,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OrbIcon(
                                    Icons.camera_alt,
                                    color: context.palette.surface,
                                  ),
                                  OrbText(
                                    '0 / 5',
                                    type: OrbTextType.bodySmall,
                                    color: context.palette.surface,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: context.palette.surfaceBright,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: context.palette.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: OrbIcon(
                                    Icons.close,
                                    size: OrbIconSize.small,
                                    color: context.palette.onPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const OrbDivider(),
                  schedule.value == null
                      ? InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ScheduleCreator(
                                  onScheduleCreated: (newSchedule) {
                                    schedule.value = newSchedule;
                                  },
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    OrbIcon(
                                      Icons.access_alarm_rounded,
                                      size: OrbIconSize.small,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: OrbText(
                                        '일정 추가',
                                        type: OrbTextType.bodyLarge,
                                        fontWeight: OrbFontWeight.medium,
                                        color: context.palette.surface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: context.palette.secondary,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: context.palette.primary,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      OrbIcon(
                                        Icons.calendar_month_rounded,
                                        size: OrbIconSize.small,
                                        color: context.palette.primary,
                                      ),
                                      const SizedBox(width: 8),
                                      OrbText(
                                        '일정',
                                        type: OrbTextType.bodyLarge,
                                        fontWeight: OrbFontWeight.medium,
                                        color: context.palette.primary,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      schedule.value = null;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: OrbIcon(
                                        Icons.close,
                                        size: OrbIconSize.small,
                                        color: context.palette.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  OrbText(
                                    "날짜",
                                    fontWeight: OrbFontWeight.medium,
                                    color: context.palette.surfaceDim,
                                  ),
                                  const SizedBox(width: 8),
                                  OrbText(
                                    DateFormat('MM월 dd일')
                                        .format(schedule.value!.date),
                                    fontWeight: OrbFontWeight.medium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  OrbText(
                                    "시간",
                                    fontWeight: OrbFontWeight.medium,
                                    color: context.palette.surfaceDim,
                                  ),
                                  const SizedBox(width: 8),
                                  OrbText(
                                    schedule.value!.time.format(context),
                                    fontWeight: OrbFontWeight.medium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  OrbText(
                                    "인원",
                                    fontWeight: OrbFontWeight.medium,
                                    color: context.palette.surfaceDim,
                                  ),
                                  const SizedBox(width: 8),
                                  OrbText(
                                    '${schedule.value!.participants}명',
                                    fontWeight: OrbFontWeight.medium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 48),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
