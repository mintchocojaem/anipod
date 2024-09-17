part of 'add_crew_screen.dart';

class CrewMemberStyleStep extends StatelessWidget {
  final PageController pageController;

  const CrewMemberStyleStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> ages = [
      "20대",
      "30대",
      "40대",
      "50대 이상",
      "제한없음",
    ];

    const List<String> maxPeoples = [
      "10명",
      "20명",
      "30명",
      "40명",
      "50명",
      "100명",
      "제한없음",
    ];

    return HookBuilder(builder: (context) {
      final selectedAge = useState(ages[0]);
      final selectedMaxPeople = useState(maxPeoples[0]);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrbText(
                    "어떤 크루와 함께하고 싶나요?",
                    type: OrbTextType.titleMedium,
                    fontWeight: OrbFontWeight.medium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OrbText(
                    "연령",
                    type: OrbTextType.bodyMedium,
                    fontWeight: OrbFontWeight.regular,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    spacing: 8, // 태그 간 간격
                    runSpacing: 8, // 행 간 간격
                    children: ages
                        .map((age) => CrewCategoryTag(
                              category: age,
                              isSelected: selectedAge.value == age,
                              onTap: () {
                                selectedAge.value = age;
                              },
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  OrbText(
                    "최대인원",
                    type: OrbTextType.bodyMedium,
                    fontWeight: OrbFontWeight.regular,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    spacing: 8, // 태그 간 간격
                    runSpacing: 8, // 행 간 간격
                    children: maxPeoples
                        .map((maxPeople) => CrewCategoryTag(
                              category: maxPeople,
                              isSelected: selectedMaxPeople.value == maxPeople,
                              onTap: () {
                                selectedMaxPeople.value = maxPeople;
                              },
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Flexible(
                child: OrbFilledButton(
                  backgroundColor: context.palette.secondary,
                  foregroundColor: context.palette.primary,
                  text: "이전으로",
                  onPressed: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: OrbFilledButton(
                  text: "다음으로",
                  onPressed: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
