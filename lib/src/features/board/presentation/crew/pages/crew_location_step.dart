part of 'crew_add_screen.dart';

class ChooseCrewLocationStep extends StatelessWidget {
  final PageController pageController;

  const ChooseCrewLocationStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final crewAdd = ref.watch(crewAddProvider);
      return HookBuilder(builder: (context) {
        final selectedLocation = useState<int>(0);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrbText(
                      "크루원들을 모집할\n동네를 선택해주세요",
                      type: OrbTextType.titleMedium,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: OrbSelectableTile(
                            title: "서울시 강남구",
                            description: "서울특별시 강남구",
                            isSelected: selectedLocation.value == index,
                            onTap: () {
                              selectedLocation.value = index;
                            },
                          ),
                        );
                      },
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
                      ref.read(crewAddProvider.notifier).setNeighborhood(
                            "서울시 강남구",
                          );
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
    });
  }
}
