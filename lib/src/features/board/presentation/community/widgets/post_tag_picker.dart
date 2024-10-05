// 태그 아이템 위젯
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../design_system/orb/orb.dart';

class PostTagPicker extends HookWidget {
  final List<String> initialTags;

  const PostTagPicker({
    super.key,
    this.initialTags = const [],
  });

  @override
  Widget build(BuildContext context) {
    // 태그 리스트 상태 관리
    final tags = useState<List<String>>(initialTags);
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
      trailing: IconButton(
        icon: OrbIcon(
          Icons.check,
          color: tags.value.isNotEmpty ? context.palette.primary : null,
        ),
        onPressed: tags.value.isNotEmpty
            ? () {
                Navigator.of(context).pop(tags.value);
              }
            : null,
      ),
      child: SizedBox(
        height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrbDivider(),
            const SizedBox(height: 16),
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
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: newTagController,
                    maxLines: 1,
                    maxLength: 20,
                    textInputAction: TextInputAction.done,
                    cursorColor: context.palette.primary,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      hintText: '태그 입력',
                      hintStyle: TextStyle(
                        color: context.palette.surfaceDim,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    onSubmitted: (value) {
                      if (value.trim().isEmpty ||
                          value.isEmpty ||
                          tags.value.length >= 5) {
                        return;
                      }
                      addTag('# $value');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
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
        color: context.palette.secondary.withOpacity(0.5),
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
