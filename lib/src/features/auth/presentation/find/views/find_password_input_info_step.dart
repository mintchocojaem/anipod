part of 'find_password_screen.dart';

Widget findPasswordInputInfoStep({
  required PageController pageController,
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
                hintText: '아이디',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              OrbTextField(
                hintText: '전화번호',
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
        text: "다음으로",
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
}
