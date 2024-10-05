part of 'crew_add_screen.dart';

class ChooseCrewCategoryStep extends StatelessWidget {
  final PageController pageController;

  const ChooseCrewCategoryStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    const List<CrewCategoryModel> categories = CrewCategoryModel.values;

    return Consumer(builder: (context, ref, _) {
      final crewAddState = ref.watch(crewAddProvider);
      return HookBuilder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrbText(
                    "어떤 크루를 만들까요?",
                    type: OrbTextType.titleMedium,
                    fontWeight: OrbFontWeight.medium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 8, // 태그 간 간격
                    runSpacing: 8, // 행 간 간격
                    children: categories
                        .map((category) => CrewCategoryTag(
                              category: category.displayName,
                              isSelected: category == crewAddState.category,
                              onTap: () {
                                ref.read(crewAddProvider.notifier).setCategory(
                                      category,
                                    );
                              },
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            OrbFilledButton(
              text: "다음으로",
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        );
      });
    });
  }
}

class CrewCategoryTag extends StatelessWidget {
  final String category;
  final bool isSelected;
  final void Function() onTap;

  const CrewCategoryTag({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected
                ? context.palette.onPrimary
                : context.palette.primary,
            width: 1,
          ),
        ),
        child: OrbText(
          category,
          type: OrbTextType.bodyMedium,
          color:
              isSelected ? context.palette.onPrimary : context.palette.primary,
        ),
      ),
    );
  }
}
