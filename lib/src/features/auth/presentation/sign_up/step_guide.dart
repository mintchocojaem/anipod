import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../design_system/orb/orb.dart';

class StepView {
  final String title;
  final Widget content;

  StepView({
    required this.title,
    required this.content,
  });
}

class StepGuide extends StatelessWidget {
  final List<StepView> steps;

  const StepGuide({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return HookBuilder(
      builder: (context) {
        final pageController = usePageController();
        final currentStep = useState(0);
        final lastStep = steps.length;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                OrbText(
                  "${currentStep.value + 1}",
                  type: OrbTextType.bodyLarge,
                  fontWeight: OrbFontWeight.medium,
                ),
                const SizedBox(
                  width: 8,
                ),
                OrbText(
                  "/",
                  type: OrbTextType.bodyLarge,
                  fontWeight: OrbFontWeight.medium,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 8,
                ),
                OrbText(
                  "$lastStep",
                  type: OrbTextType.bodyLarge,
                  fontWeight: OrbFontWeight.medium,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Flexible(
              child: PageView.builder(
                controller: pageController,
                pageSnapping: false,
                itemCount: steps.length,
                onPageChanged: (index) {
                  currentStep.value = index;
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrbText(
                        steps[index].title,
                        type: OrbTextType.titleLarge,
                        fontWeight: OrbFontWeight.medium,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: steps[index].content,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
