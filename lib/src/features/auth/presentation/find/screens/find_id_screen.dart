import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../design_system/orb/orb.dart';

part 'find_id_input_info_step.dart';

@RoutePage()
class FindIdScreen extends StatelessWidget {
  const FindIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return OrbStepGuide(
          appBarTitle: '아이디 찾기',
          showPageIndicator: false,
          steps: (pageController) => [
            FindIdInputInfoStep(
              pageController: pageController,
              onTapSubmitButton: () {
                ref
                    .read(routerServiceProvider)
                    .replace(const FindIdCompleteRoute());
              },
            ),
          ],
        );
      },
    );
  }
}
