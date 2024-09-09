part of 'sign_up_screen.dart';

class SignUpAgreePolicyStep extends StatelessWidget {
  final PageController pageController;

  const SignUpAgreePolicyStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final agreeService = useState(false);
      final agreePrivacy = useState(false);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrbText(
            "약관 동의하기",
            type: OrbTextType.titleMedium,
            fontWeight: OrbFontWeight.medium,
          ),
          const SizedBox(
            height: 16,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrbTile(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    onTap: () {
                      agreeService.value = !agreeService.value;
                      agreePrivacy.value = !agreePrivacy.value;
                    },
                    leading: agreePrivacy.value && agreeService.value
                        ? OrbIcon(Icons.check_box)
                        : OrbIcon(Icons.check_box_outline_blank_rounded),
                    title: const OrbText(
                      '전체 동의(필수)',
                      type: OrbTextType.bodyLarge,
                      fontWeight: OrbFontWeight.medium,
                    ),
                  ),
                  const OrbDivider(),
                  OrbTile(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    onTap: () {
                      agreeService.value = !agreeService.value;
                    },
                    leading: agreeService.value
                        ? OrbIcon(Icons.check_box)
                        : OrbIcon(Icons.check_box_outline_blank_rounded),
                    title: const OrbText('서비스 이용약관(필수)'),
                    trailing: OrbIcon(
                      Icons.chevron_right_outlined,
                    ),
                  ),
                  OrbTile(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    onTap: () {
                      agreePrivacy.value = !agreePrivacy.value;
                    },
                    leading: agreePrivacy.value
                        ? OrbIcon(Icons.check_box)
                        : OrbIcon(Icons.check_box_outline_blank_rounded),
                    title: const OrbText('개인정보 수집 및 이용 동의(필수)'),
                    trailing: OrbIcon(
                      Icons.chevron_right_outlined,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          OrbFilledButton(
            text: "다음으로",
            disabled: !(agreePrivacy.value && agreeService.value),
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(
                  milliseconds: 250,
                ),
                curve: Curves.easeIn,
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      );
    });
  }
}
