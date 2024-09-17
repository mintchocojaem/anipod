part of 'add_crew_screen.dart';

class ChooseCrewCategoryStep extends StatelessWidget {
  final PageController pageController;

  const ChooseCrewCategoryStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> categories = [
      "반려동물",
      "봉사활동",
      "동네친구",
      "운동",
      "취미",
      "기타",
    ];

    return HookBuilder(builder: (context) {
      final selectedCategory = useState(categories[0]);

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
                            category: category,
                            isSelected: selectedCategory.value == category,
                            onTap: () {
                              selectedCategory.value = category;
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
