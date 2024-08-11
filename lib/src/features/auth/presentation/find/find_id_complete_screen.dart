

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/router/router_service.dart';
import '../../../../design_system/orb/orb.dart';

@RoutePage()
class FindIdCompleteScreen extends StatelessWidget {
  const FindIdCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      body: Column(
        children: [
          Flexible(
            child: Center(
              child: Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 16,),
          Consumer(
              builder: (context, ref, _) {
                return OrbFilledButton(
                  onPressed: () {
                    ref.read(routerServiceProvider).back();
                  },
                  text: "로그인하러 가기",
                );
              }
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
