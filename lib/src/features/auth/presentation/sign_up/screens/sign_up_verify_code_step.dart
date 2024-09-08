part of 'sign_up_screen.dart';

Widget signUpVerifyCodeStep({
  required PageController pageController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      OrbText(
        "인증 코드 입력하기",
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
