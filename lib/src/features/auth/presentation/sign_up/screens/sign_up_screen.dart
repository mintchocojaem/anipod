import 'package:anipod/src/core/services/router/router_service.gr.dart';
import 'package:anipod/src/core/utils/auth_validator.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/utils/app_exception.dart';
import '../providers/sign_up_provider.dart';

part 'sign_up_agree_policy_step.dart';
part 'sign_up_input_info_step.dart';
part 'sign_up_send_code_step.dart';
part 'sign_up_verify_code_step.dart';

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
                SignUpSendCodeStep(
                  pageController: pageController,
                ),
                SignUpVerifyCodeStep(
                  pageController: pageController,
                ),
                SignUpInputInfoStep(
                  pageController: pageController,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
