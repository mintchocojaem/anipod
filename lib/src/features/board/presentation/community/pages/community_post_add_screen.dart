import 'dart:io';

import 'package:anipod/src/core/utils/app_exception.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../design_system/orb/orb.dart';
import '../../../domain/models/community_category.dart';
import '../providers/community_post_add_provider.dart';
import '../widgets/post_tag_picker.dart';

@RoutePage()
class CommunityPostAddScreen extends StatelessWidget {
  const CommunityPostAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final tags = useState<List<String>>([]);
      final images = useState<List<XFile>>([]);

      final titleController = useTextEditingController();
      final contentController = useTextEditingController();

      final isSubmitEnabled = useState<bool>(false);

      return Consumer(builder: (context, ref, child) {
        ref.listen(
          communityPostAddProvider,
          (_, next) {
            if (!next.isLoading && next.hasError) {
              final error = next.error;
              if (error is! AppException) return;
              context.showErrorSnackBar(
                error: error,
              );
            }
          },
        );

        return OrbScaffold(
          resizeToAvoidBottomInset: true,
          appBar: OrbAppBar(
            title: '글쓰기',
            centerTitle: true,
            trailing: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: OrbFilledButton(
                text: '올리기',
                disabled: !isSubmitEnabled.value,
                buttonRadius: OrbButtonRadius.small,
                buttonSize: OrbButtonSize.compact,
                buttonTextType: OrbButtonTextType.medium,
                onPressed: () async {
                  if (!isSubmitEnabled.value) return;
                  final result = await ref
                      .read(communityPostAddProvider.notifier)
                      .addPost(
                        title: titleController.text,
                        body: contentController.text,
                        category: CommunityCategoryModel.volunteer,
                        imagesPath: images.value.map((e) => e.path).toList(),
                        tags: tags.value,
                      );
                  if (result) {
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ),
          body: Consumer(
            builder: (context, ref, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tags.value.isEmpty
                      ? GestureDetector(
                          onTap: () {
                            showOrbModalBottomSheet(
                              context,
                              PostTagPicker(),
                            ).then((value) {
                              if (value != null) {
                                tags.value = value;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
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
                                        color: context.palette.surface,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    for (final tag in tags.value)
                                      GestureDetector(
                                        onTap: () {
                                          showOrbModalBottomSheet(
                                            context,
                                            PostTagPicker(
                                              initialTags: tags.value,
                                            ),
                                          ).then((value) {
                                            if (value != null) {
                                              tags.value = value;
                                            }
                                          });
                                        },
                                        child: PostTagItem(
                                          tag: tag,
                                          onDelete: () {
                                            tags.value = tags.value
                                                .where((t) => t != tag)
                                                .toList();
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  OrbDivider(),
                  OrbTextField(
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                    controller: titleController,
                    hintText: '제목을 입력해주세요',
                    maxLines: 1,
                    maxLength: 50,
                    style: OrbTextType.bodyLarge,
                    fillColor: Colors.transparent,
                    boarderColor: Colors.transparent,
                    onChanged: (value) {
                      isSubmitEnabled.value =
                          value.isNotEmpty && contentController.text.isNotEmpty;
                    },
                  ),
                  OrbDivider(),
                  Expanded(
                    child: OrbTextField(
                      contentPadding: EdgeInsets.only(top: 16),
                      controller: contentController,
                      hintText: '내용을 입력해주세요',
                      style: OrbTextType.bodyLarge,
                      fillColor: Colors.transparent,
                      boarderColor: Colors.transparent,
                      maxLines: null,
                      maxLength: 1000,
                      onChanged: (value) {
                        isSubmitEnabled.value =
                            value.isNotEmpty && titleController.text.isNotEmpty;
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //image picker
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              final imagePicker = ImagePicker();
                              final pickedImage = await imagePicker
                                  .pickImage(source: ImageSource.gallery)
                                  .onError((error, stackTrace) {
                                if (!context.mounted) return;
                                context.showErrorSnackBar(
                                  error: AppError(
                                    message: '갤러리를 열 수 없어요.\n(설정에서 권한을 확인해주세요)',
                                    stackTrace: stackTrace,
                                  ),
                                );
                                return null;
                              });
                              if (pickedImage != null) {
                                images.value = [...images.value, pickedImage];
                              }
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: context.palette.surfaceBright,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: OrbIcon(
                                  Icons.add_a_photo_rounded,
                                  color: context.palette.surface,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ...images.value.map((image) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: context.palette.surfaceBright,
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: FileImage(File(image.path)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      images.value = images.value
                                          .where(
                                              (img) => img.path != image.path)
                                          .toList();
                                    },
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
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  /*
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
                       */
                ],
              );
            },
          ),
        );
      });
    });
  }
}
