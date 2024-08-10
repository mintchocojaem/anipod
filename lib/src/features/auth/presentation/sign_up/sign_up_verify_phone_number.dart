part of 'sign_up_screen.dart';

StepView signUpVerifyPhoneNumber() {
  return StepView(
    title: "전화번호 인증하기",
    nextButtonTitle: "다음으로",
    onTapNextPage: () {},
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrbTextField(
          hintText: "010-XXXX-XXXX",
          keyboardType: TextInputType.phone,
          onChanged: (value) {},
        ),
      ],
    ),
  );
}
