import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/features/board/domain/models/crew_category.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../design_system/orb/orb.dart';
import '../providers/crew_add_provider.dart';

part 'crew_category_step.dart';
part 'crew_introduce_step.dart';
part 'crew_join_options_step.dart';
part 'crew_location_step.dart';
part 'crew_member_style_step.dart';

@RoutePage()
class CrewAddScreen extends StatelessWidget {
  const CrewAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      padding: EdgeInsets.zero,
      body: OrbStepGuide(
        appBarTitle: '',
        steps: (pageController) => [
          ChooseCrewCategoryStep(
            pageController: pageController,
          ),
          IntroduceCrewStep(
            pageController: pageController,
          ),
          ChooseCrewLocationStep(
            pageController: pageController,
          ),
          CrewMemberStyleStep(
            pageController: pageController,
          ),
          CrewJoinOptionsStep(
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}
