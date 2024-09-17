// 태그 아이템 위젯
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../design_system/orb/orb.dart';

class PostTagPicker extends HookWidget {
  const PostTagPicker({super.key});

  @override
  Widget build(BuildContext context) {
    // 태그 리스트 상태 관리
    final tags = useState<List<String>>(['# 태그 1', '# 태그 2']);
    final newTagController = useTextEditingController();

    // 태그 추가 함수
    void addTag(String tag) {
      if (tag.isNotEmpty && !tags.value.contains(tag)) {
        tags.value = [...tags.value, tag];
      }
      newTagController.clear();
    }

    // 태그 삭제 함수
    void removeTag(String tag) {
      tags.value = tags.value.where((t) => t != tag).toList();
    }

    return OrbModalBottomSheet(
      titleText: '태그 추가',
      centerTitle: true,
      trailing: OrbFilledButton(
        text: '완료',
        buttonSize: OrbButtonSize.compact,
        buttonRadius: OrbButtonRadius.small,
        backgroundColor: Colors.transparent,
        foregroundColor: context.palette.surfaceDim,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrbDivider(),
          const SizedBox(height: 8),
          // 태그 리스트
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var tag in tags.value)
                PostTagItem(
                  tag: tag,
                  onDelete: () => removeTag(tag),
                ),
              // 새 태그 입력 필드
              Container(
                padding: const EdgeInsets.only(left: 8),
                child: TextField(
                  controller: newTagController,
                  maxLines: 1,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    hintText: '태그 입력',
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  onSubmitted: (value) {
                    addTag('# $value');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          OrbDivider(),
          const SizedBox(height: 24),
          const OrbText(
            '생성된 태그',
            type: OrbTextType.bodyMedium,
            fontWeight: OrbFontWeight.medium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              PostTagItem(tag: '# 강아지', onDelete: () {}),
            ],
          ),
          const SizedBox(height: 24),
          const OrbText(
            '자주 사용한 태그',
            type: OrbTextType.bodyMedium,
            fontWeight: OrbFontWeight.medium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              PostTagItem(tag: '# 게시물 태그 1', onDelete: () {}),
            ],
          ),
          const SizedBox(height: 24),
          const OrbText(
            '내가 사용한 태그',
            type: OrbTextType.bodyMedium,
            fontWeight: OrbFontWeight.medium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              for (var i = 0; i < 6; i++)
                PostTagItem(tag: '# 게시물 태그 1', onDelete: () {}),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PostTagItem extends StatelessWidget {
  final String tag;
  final VoidCallback onDelete;

  const PostTagItem({required this.tag, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.palette.secondary.withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          OrbText(
            tag,
            fontWeight: OrbFontWeight.medium,
            color: context.palette.primary,
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onDelete,
            child: OrbIcon(
              Icons.close,
              size: OrbIconSize.small,
              color: context.palette.primary,
            ),
          ),
        ],
      ),
    );
  }
}
