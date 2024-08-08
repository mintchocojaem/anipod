import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'step_guide.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HookBuilder(
      builder: (context) {
        return OrbScaffold(
          resizeToAvoidBottomInset: true,
          appBar: OrbAppBar(
            title: "회원가입",
            centerTitle: true,
          ),
          body: StepGuide(
            steps: [
              StepView(
                title: "가입 정보 입력하기",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrbTextField(
                      hintText: '닉네임',
                      textInputAction: TextInputAction.next,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: OrbFilledButton(
                          buttonSize: OrbButtonSize.compact,
                          buttonTextType: OrbButtonTextType.small,
                          buttonRadius: OrbButtonRadius.small,
                          onPressed: () async {},
                          text: "중복확인",
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    OrbTextField(
                      hintText: '이메일',
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    OrbTextField(
                      hintText: '비밀번호',
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    OrbTextField(
                      hintText: '비밀번호 확인',
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 32),
                    OrbFilledButton(
                      onPressed: () {},
                      text: "다음으로",
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
