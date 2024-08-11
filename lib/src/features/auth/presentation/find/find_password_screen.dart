import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/router/router_service.dart';
import '../../../../core/services/router/router_service.gr.dart';
import '../../../../design_system/orb/orb.dart';
import '../sign_up/step_guide.dart';

part 'find_password_input_info_step.dart';
part 'find_password_reset_step.dart';

@RoutePage()
class FindPasswordScreen extends StatelessWidget {
  const FindPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return StepGuide(
          appBarTitle: '비밀번호 찾기',
          showPageIndicator: false,
          steps: [
            findPasswordInputInfoStep(),
            findPasswordResetStep(
              onTapSubmitButton: () {
                ref
                    .read(routerServiceProvider)
                    .replace(const FindPasswordCompleteRoute());
              },
            ),
          ],
        );
      },
    );
  }
}
