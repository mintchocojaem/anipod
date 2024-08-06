import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OrbScaffold(
      appBar: OrbAppBar(
        title: "Login",
      ),
      body: Container(),
    );
  }
}
