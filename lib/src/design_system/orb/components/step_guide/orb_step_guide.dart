import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../orb.dart';

class OrbStepGuide extends StatelessWidget {
  final List<Widget> Function(PageController pageController) steps;
  final String? appBarTitle;
  final bool showPageIndicator;

  const OrbStepGuide({
    super.key,
    required this.steps,
    this.appBarTitle,
    this.showPageIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;
    return HookBuilder(
      builder: (context) {
        final pageController = usePageController();
        final currentStep = useState(0);
        final lastStep = steps(pageController).length;

        pageController.addListener(() {
          FocusScope.of(context).unfocus();
        });
        return OrbScaffold(
          resizeToAvoidBottomInset: true,
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
                      color: palette.surface,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    OrbText(
                      "$lastStep",
                      type: OrbTextType.bodyLarge,
                      fontWeight: OrbFontWeight.medium,
                      color: palette.surface,
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
                  itemCount: lastStep,
                  onPageChanged: (index) async {
                    //hide keyboard
                    currentStep.value = index;
                  },
                  itemBuilder: (context, index) {
                    return steps(pageController)[index];
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
