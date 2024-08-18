part of 'sign_up_screen.dart';

Widget signUpVerifyPhoneNumber({
  required PageController pageController,
}) {
  return HookBuilder(builder: (context) {
    final phoneNumberController = useTextEditingController();
    final isButtonEnabled = useState(false);
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
        Flexible(
          child: SingleChildScrollView(
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
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        OrbFilledButton(
          text: "다음으로",
          disabled: !isButtonEnabled.value,
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
