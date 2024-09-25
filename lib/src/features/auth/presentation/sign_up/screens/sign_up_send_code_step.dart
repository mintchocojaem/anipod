part of 'sign_up_screen.dart';

class SignUpSendCodeStep extends StatelessWidget with AuthValidator {
  final PageController pageController;

  const SignUpSendCodeStep({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
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

      return HookBuilder(builder: (context) {
        final phoneNumberController = useTextEditingController();
        final isButtonEnabled = useState(false);

        final formKey = useMemoized(() => GlobalKey<FormState>());

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrbText(
              "전화번호 인증하기",
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
                        hintText: "010-XXXX-XXXX",
                        maxLength: 11,
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          if (phoneNumberController.text.length == 11) {
                            isButtonEnabled.value = true;
                          } else {
                            isButtonEnabled.value = false;
                          }
                        },
                        validator: (value) {
                          return validatePhoneNumber(
                            phoneNumber: value,
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            OrbFilledButton(
              text: "인증번호 발송",
              disabled: !isButtonEnabled.value,
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                ref.read(signUpProvider.notifier).setPhoneNumber(
                      phoneNumber: phoneNumberController.text,
                    );
                final result = await ref
                    .read(signUpProvider.notifier)
                    .sendVerificationCode();
                if (result) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
            const SizedBox(height: 8),
          ],
        );
      });
    });
  }
}
