part of 'sign_up_screen.dart';

class SignUpInputInfoStep extends StatelessWidget {
  final PageController pageController;
  final Function() onTapSubmitButton;

  const SignUpInputInfoStep({
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
          "가입 정보 입력하기",
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
                OrbTextField(
                  hintText: '닉네임',
                  textInputAction: TextInputAction.next,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: OrbFilledButton(
                      buttonSize: OrbButtonSize.compact,
                      buttonTextType: OrbButtonTextType.small,
                      buttonRadius: OrbButtonRadius.small,
                      onPressed: () async {},
                      text: "중복확인",
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OrbTextField(
                  hintText: '이메일',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                OrbTextField(
                  hintText: '비밀번호',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                OrbTextField(
                  hintText: '비밀번호 확인',
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        OrbFilledButton(
          text: "다음으로",
          onPressed: () {
            onTapSubmitButton();
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
