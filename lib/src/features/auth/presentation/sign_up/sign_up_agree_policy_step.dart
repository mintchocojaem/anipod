part of 'sign_up_screen.dart';

StepView signUpAgreePolicyStep() {
  return StepView(
    title: "약관 동의하기",
    nextButtonTitle: "다음으로",
    onTapSubmitButton: (pageController) {
      pageController.nextPage(
        duration: const Duration(
          milliseconds: 250,
        ),
        curve: Curves.easeIn,
      );
    },
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrbTile(
          padding: EdgeInsets.symmetric(
            vertical: 4,
          ),
          leading: Checkbox(
            value: false,
            onChanged: (bool? value) {},
          ),
          title: const OrbText(
            '전체 동의(필수)',
            type: OrbTextType.bodyLarge,
            fontWeight: OrbFontWeight.medium,
          ),
        ),
        const OrbDivider(),
        OrbTile(
          padding: EdgeInsets.symmetric(
            vertical: 4,
          ),
          leading: Checkbox(
            value: false,
            onChanged: (bool? value) {},
          ),
          title: const OrbText('서비스 이용약관(필수)'),
          trailing: OrbIcon(
            Icons.chevron_right_outlined,
          ),
        ),
        OrbTile(
          padding: EdgeInsets.symmetric(
            vertical: 4,
          ),
          leading: Checkbox(
            value: false,
            onChanged: (bool? value) {},
          ),
          title: const OrbText('개인정보 수집 및 이용 동의(필수)'),
          trailing: OrbIcon(
            Icons.chevron_right_outlined,
          ),
        ),
        OrbTile(
          padding: EdgeInsets.symmetric(
            vertical: 4,
          ),
          leading: Checkbox(
            value: false,
            onChanged: (bool? value) {},
          ),
          title: const OrbText('만 14세 이상 확인(필수)'),
          trailing: OrbIcon(
            Icons.chevron_right_outlined,
          ),
        ),
      ],
    ),
  );
}
