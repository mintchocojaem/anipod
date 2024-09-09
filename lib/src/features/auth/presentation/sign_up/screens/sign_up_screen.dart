import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';

part 'sign_up_agree_policy_step.dart';
part 'sign_up_input_info_step.dart';
part 'sign_up_verify_code_step.dart';
part 'sign_up_verify_phone_number_step.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build'
    return HookBuilder(
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            return OrbStepGuide(
              appBarTitle: "회원가입",
              showPageIndicator: true,
              steps: (pageController) => [
                SignUpAgreePolicyStep(
                  pageController: pageController,
                ),
                SignUpVerifyPhoneNumberStep(
                  pageController: pageController,
                ),
                SignUpVerifyCodeStep(
                  pageController: pageController,
                ),
                SignUpInputInfoStep(
                  pageController: pageController,
                  onTapSubmitButton: () {
                    ref
                        .read(routerServiceProvider)
                        .replace(const SignUpCompleteRoute());
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
