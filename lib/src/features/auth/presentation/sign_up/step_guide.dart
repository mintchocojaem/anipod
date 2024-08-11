import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../design_system/orb/orb.dart';

class StepView {
  final String title;
  final String nextButtonTitle;
  final void Function(PageController controller) onTapSubmitButton;
  final Widget content;

  const StepView({
    required this.title,
    required this.nextButtonTitle,
    required this.onTapSubmitButton,
    required this.content,
  });
}

class StepGuide extends StatelessWidget {
  final List<StepView> steps;
  final String? appBarTitle;
  final bool showPageIndicator;

  const StepGuide({
    super.key,
    required this.steps,
    this.appBarTitle,
    this.showPageIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    return HookBuilder(
      builder: (context) {
        final pageController = usePageController();
        final currentStep = useState(0);
        final lastStep = steps.length;
        return OrbScaffold(
          appBar: appBarTitle != null
              ? OrbAppBar(
            title: appBarTitle!,
            centerTitle: true,
          )
              : null,
          body: Column(
            children: [
              if (showPageIndicator)
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
                  physics: const NeverScrollableScrollPhysics(),
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
                          type: OrbTextType.titleMedium,
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
                        const SizedBox(height: 8),
                        OrbFilledButton(
                          text: steps[index].nextButtonTitle,
                          onPressed: () {
                            steps[index].onTapSubmitButton(pageController);
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
