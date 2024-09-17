part of 'add_crew_screen.dart';

class CrewJoinOptionsStep extends StatelessWidget {
  final PageController pageController;

  const CrewJoinOptionsStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final selectedOption = useState<int>(0);
      return Consumer(builder: (context, ref, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrbText(
                      "가입 방법을 선택해주세요",
                      type: OrbTextType.titleMedium,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: OrbSelectableTile(
                            title: "바로 가입",
                            description: "크루 대표의 승인 없이 누구나 가입이 가능해요",
                            isSelected: selectedOption.value == 0,
                            onTap: () {
                              selectedOption.value = 0;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: OrbSelectableTile(
                            title: "승인 후 가입",
                            description: "크루 대표의 승인 후 가입이 가능해요",
                            isSelected: selectedOption.value == 1,
                            onTap: () {
                              selectedOption.value = 1;
                            },
                          ),
                        ),
                      ],
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
                      ref
                          .read(routerServiceProvider)
                          .push(const AddCrewCompleteRoute());
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
