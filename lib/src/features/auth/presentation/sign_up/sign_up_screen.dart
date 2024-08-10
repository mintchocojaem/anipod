import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/router/router_service.dart';
import '../../../../core/services/router/router_service.gr.dart';
import '.dart';
import 'step_guide.dart';

part 'sign_up_agree_policy_step.dart';

part 'sign_up_verify_phone_number.dart';

part 'sign_up_verify_code.dart';

part 'sign_up_input_info_step.dart';

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
          body: Consumer(builder: (context, ref, _) {
            return StepGuide(
              steps: [
                signUpAgreePolicyStep(),
                signUpVerifyPhoneNumber(),
                signUpVerifyCode(),
                signUpInputInfoStep(
                  onTapNextPage: () {
                    ref
                        .read(routerServiceProvider)
                        .replace(const SignUpCompleteRoute());
                  },
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
