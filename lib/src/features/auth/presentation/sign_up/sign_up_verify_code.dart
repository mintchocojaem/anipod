part of 'sign_up_screen.dart';

StepView signUpVerifyCode() {
  return StepView(
    title: "인증 코드 입력하기",
    nextButtonTitle: "다음으로",
    onTapNextPage: () {},
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              for (int i = 0; i < 6; i++)
                Flexible(
                  flex: 1,
                  child: Center(
                    child: SizedBox(
                      width: 40,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        autocorrect: false,
                        enableSuggestions: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            //FocusScope.of(context).nextFocus();
                          }
                        },
                                        ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
