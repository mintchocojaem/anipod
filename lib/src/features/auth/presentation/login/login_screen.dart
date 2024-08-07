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
      appBar: OrbAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Image.asset('assets/icons/anipod_logo.png'),
          const SizedBox(height: 32),
          OrbTextField(
            hintText: 'Email',
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          OrbTextField(
            obscureText: true,
            hintText: 'Password',
          ),
          const SizedBox(height: 16),
          OrbFilledButton(
            onPressed: () {},
            text: "로그인",
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrbTextButton(
                onPressed: () {},
                text: "아이디 찾기",
              ),
              const SizedBox(width: 8),
              const OrbText(
                "|",
              ),
              const SizedBox(width: 8),
              OrbTextButton(
                onPressed: () {},
                text: "비밀번호 찾기",
              ),
              const SizedBox(width: 8),
              const OrbText(
                "|",
              ),
              const SizedBox(width: 8),
              OrbTextButton(
                onPressed: () {},
                text: "회원가입 찾기",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
