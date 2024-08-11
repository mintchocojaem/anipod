part of 'find_password_screen.dart';

StepView findPasswordInputInfoStep() {
  return StepView(
    title: '가입 정보 입력하기',
    nextButtonTitle: '다음',
    onTapSubmitButton: (pageController) {
      pageController.nextPage(
        duration: const Duration(
          milliseconds: 250,
        ),
        curve: Curves.easeIn,
      );
    },
    content: Column(
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
  );
}