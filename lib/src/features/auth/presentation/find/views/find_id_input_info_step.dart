part of 'find_id_screen.dart';

Widget findIdInputInfoStep({
  required PageController pageController,
  required Function() onTapSubmitButton,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      OrbText(
        '가입 정보 입력하기',
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
              const SizedBox(height: 16),
              OrbTextField(
                hintText: '전화번호',
                textInputAction: TextInputAction.next,
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
        onPressed: () {
          onTapSubmitButton();
        },
      ),
      const SizedBox(height: 8),
    ],
  );
}
