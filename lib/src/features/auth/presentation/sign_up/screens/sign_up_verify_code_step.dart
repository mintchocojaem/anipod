part of 'sign_up_screen.dart';

class SignUpVerifyCodeStep extends StatelessWidget {
  final PageController pageController;

  const SignUpVerifyCodeStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final code = useState('      ');

      return Consumer(builder: (context, ref, child) {
        ref.listen(
          signUpProvider,
          (prev, next) {
            if (!next.isLoading && next.hasError) {
              final error = next.error;
              if (error is! AppException) return;
              context.showErrorSnackBar(
                error: error,
              );
            }
          },
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrbText(
              "인증 코드 입력하기",
              type: OrbTextType.titleMedium,
              fontWeight: OrbFontWeight.medium,
            ),
            const SizedBox(height: 8),
            OrbText(
              "핸드폰으로 전송된 코드를\n하단에 입력해주세요",
              color: context.palette.surface,
              fontWeight: OrbFontWeight.medium,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Flexible(
                                  flex: 1,
                                  child: Center(
                                    child: SizedBox(
                                      width: 40,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        maxLength: 1,
                                        autocorrect: false,
                                        enableSuggestions: false,
                                        cursorColor: context.palette.primary,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: context.palette.surfaceDim,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: context.palette.surfaceDim,
                                            ),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          if (value.length == 1) {
                                            FocusScope.of(context).nextFocus();
                                          }
                                          code.value = code.value
                                              .replaceRange(i, i + 1, value);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          OrbFilledButton(
                            text: "인증번호 재전송",
                            foregroundColor: context.palette.primary,
                            backgroundColor: context.palette.secondary,
                            buttonCoolDown: const Duration(seconds: 60),
                            showCoolDownTime: true,
                            buttonRadius: OrbButtonRadius.small,
                            buttonSize: OrbButtonSize.compact,
                            buttonTextType: OrbButtonTextType.small,
                            onPressed: () async {
                              final result = await ref
                                  .read(signUpProvider.notifier)
                                  .sendVerificationCode();
                              if (!result || !context.mounted) return;
                              context.showSnackBar(message: "인증번호가 재전송되었습니다");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            OrbFilledButton(
              text: "다음으로",
              disabled: code.value.contains(' '),
              onPressed: () async {
                final result = await ref
                    .read(signUpProvider.notifier)
                    .checkVerificationCode(
                      code: code.value,
                    );
                if (!result) return;
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
    });
  }
}
