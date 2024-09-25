part of 'sign_up_screen.dart';

class SignUpInputInfoStep extends StatelessWidget with AuthValidator {
  final PageController pageController;

  const SignUpInputInfoStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final nicknameController = useTextEditingController();
      final emailController = useTextEditingController();
      final passwordController = useTextEditingController();
      final confirmPasswordController = useTextEditingController();

      final formKey = useMemoized(() => GlobalKey<FormState>());

      return Consumer(builder: (context, ref, _) {
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
              "가입 정보 입력하기",
              type: OrbTextType.titleMedium,
              fontWeight: OrbFontWeight.medium,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrbTextField(
                        controller: nicknameController,
                        hintText: '닉네임',
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          return validateNickname(
                            nickname: value,
                          );
                        },
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
                        controller: emailController,
                        hintText: '이메일',
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          return validateEmail(
                            email: value,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      OrbTextField(
                        controller: passwordController,
                        hintText: '비밀번호',
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        validator: (value) {
                          return validatePassword(
                            password: value,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      OrbTextField(
                        controller: confirmPasswordController,
                        hintText: '비밀번호 확인',
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        validator: (value) {
                          return validatePasswordConfirm(
                            password: passwordController.text,
                            passwordConfirm: value,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            OrbFilledButton(
              text: "다음으로",
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                final response = await ref.read(signUpProvider.notifier).signUp(
                      nickname: nicknameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );

                if (!response) return;

                ref.read(routerServiceProvider).replace(
                      SignUpCompleteRoute(),
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
