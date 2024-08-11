part of 'find_id_screen.dart';

StepView findIdInputInfoStep({
  required Function() onTapSubmitButton,
}) {
  return StepView(
    title: '가입 정보 입력하기',
    nextButtonTitle: '아이디 찾기',
    onTapSubmitButton: (_) {
      onTapSubmitButton();
    },
    content: Column(
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
  );
}