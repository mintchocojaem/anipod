part of 'find_id_screen.dart';

class FindIdInputInfoStep extends StatelessWidget {
  final PageController pageController;
  final Function() onTapSubmitButton;

  const FindIdInputInfoStep({
    super.key,
    required this.pageController,
    required this.onTapSubmitButton,
  });

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final phoneNumberController = useTextEditingController();
      final isButtonEnabled = useState(false);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrbText(
            '가입 정보 입력하기',
            type: OrbTextType.titleMedium,
            fontWeight: OrbFontWeight.medium,
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  OrbTextField(
                    hintText: '전화번호',
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
                  const SizedBox(height: 16),
                  OrbTextField(
                    hintText: '생년월일',
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
            text: "아이디 찾기",
            disabled: !isButtonEnabled.value,
            onPressed: () {
              onTapSubmitButton();
            },
          ),
          const SizedBox(height: 8),
        ],
      );
    });
  }
}
