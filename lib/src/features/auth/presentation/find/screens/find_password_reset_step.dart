part of 'find_password_screen.dart';

class FindPasswordResetStep extends StatelessWidget {
  final PageController pageController;
  final Function() onTapSubmitButton;

  const FindPasswordResetStep({
    super.key,
    required this.pageController,
    required this.onTapSubmitButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrbText(
          '비밀번호 재설정',
          type: OrbTextType.titleMedium,
          fontWeight: OrbFontWeight.medium,
        ),
        const SizedBox(
          height: 16,
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: [
                OrbTextField(
                  hintText: '비밀번호',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                OrbTextField(
                  hintText: '비밀번호 확인',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        OrbFilledButton(
          text: "비밀번호 재설정하기",
          onPressed: () {
            onTapSubmitButton();
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
