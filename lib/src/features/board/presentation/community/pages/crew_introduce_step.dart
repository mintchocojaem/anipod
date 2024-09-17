part of 'add_crew_screen.dart';

class IntroduceCrewStep extends StatelessWidget {
  final PageController pageController;

  const IntroduceCrewStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrbText(
                  "크루를 소개해주세요",
                  type: OrbTextType.titleMedium,
                  fontWeight: OrbFontWeight.medium,
                ),
                const SizedBox(
                  height: 16,
                ),
                OrbText(
                  "크루명",
                  type: OrbTextType.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                OrbTextField(
                  hintText: "크루명을 지어주세요",
                  maxLength: 25,
                  showCounterText: true,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 16,
                ),
                OrbText(
                  "크루 소개글",
                  type: OrbTextType.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                OrbTextField(
                  hintText: "크루 활동 및 소개 등의 설명을 입력해주세요",
                  maxLength: 500,
                  maxLines: 4,
                  showCounterText: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                OrbText(
                  "크루 가입비",
                  type: OrbTextType.bodyMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                OrbTextField(
                  hintText: "크루 가입비를 입력해주세요",
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Flexible(
                      child: OrbText(
                        "Tip",
                        type: OrbTextType.bodyLarge,
                        color: context.palette.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    OrbText(
                      "크루 소개글을 참고해보세요",
                      type: OrbTextType.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: context.palette.secondary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrbText(
                        "- 주로 어떤 활동을 하나요?",
                        type: OrbTextType.bodyMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      OrbText(
                        "- 언제, 어디에서 활동하나요?",
                        type: OrbTextType.bodyMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      OrbText(
                        "- 어떤 사람들과 함께하고 싶나요?",
                        type: OrbTextType.bodyMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      OrbText(
                        "- 모임에서 지켜야 할 규칙이 있나요?\n  (가입조건, 출석조건, 강퇴조건 등)",
                        type: OrbTextType.bodyMedium,
                      ),
                    ],
                  ),
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
  }
}
