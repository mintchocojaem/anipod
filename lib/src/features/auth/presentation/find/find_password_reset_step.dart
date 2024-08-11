part of 'find_password_screen.dart';

StepView findPasswordResetStep({
  required Function() onTapSubmitButton,
}) {
  return StepView(
    title: '비밀번호 재설정',
    nextButtonTitle: '비밀번호 재설정하기',
    onTapSubmitButton: (_) {
      onTapSubmitButton();
    },
    content: Column(
      children: [
        const SizedBox(height: 16),
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
  );
}