import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/services/router/router_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return MaterialApp.router(
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          routerConfig: ref.watch(routerServiceProvider).config(),
        );
      },
    );
  }
}
