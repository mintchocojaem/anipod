import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/router/router_service.dart';
import '../../../../../core/services/router/router_service.gr.dart';
import '../../../../../core/utils/app_exception.dart';
import '../providers/login_token_provider.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HookBuilder(
      builder: (context) {
        final idController = useTextEditingController();
        final passwordController = useTextEditingController();

        final isLoginButtonEnabled = useState(false);

        return OrbScaffold(
          appBar: const OrbAppBar(),
          body: Consumer(
            builder: (context, ref, _) {
              ref.listen(
                loginTokenNotifierProvider,
                (_, next) {
                  if (next.isLoading) {
                    return;
                  } else if (next.hasError) {
                    final error = next.error;
                    if (error is! AppException) return;
                    context.showErrorSnackBar(
                      error: error,
                    );
                  } else if (next.hasValue) {
                    //ref.read(routerServiceProvider).pushNamed()
                  }
                },
              );

              return Column(
                children: [
                  const SizedBox(height: 32),
                  Image.asset('assets/icons/anipod_logo.png'),
                  const SizedBox(height: 32),
                  OrbTextField(
                    controller: idController,
                    hintText: 'Email',
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      isLoginButtonEnabled.value = value.isNotEmpty &&
                          passwordController.text.isNotEmpty;
                    },
                  ),
                  const SizedBox(height: 16),
                  OrbTextField(
                    controller: passwordController,
                    obscureText: true,
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      isLoginButtonEnabled.value =
                          value.isNotEmpty && idController.text.isNotEmpty;
                    },
                  ),
                  const SizedBox(height: 16),
                  OrbFilledButton(
                    disabled: !isLoginButtonEnabled.value,
                    onPressed: () async {
                      await ref.read(loginTokenNotifierProvider.notifier).login(
                            loginId: idController.text,
                            password: passwordController.text,
                          );
                    },
                    text: "로그인",
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OrbTextButton(
                        onPressed: () {
                          ref
                              .read(routerServiceProvider)
                              .push(const FindIdRoute());
                        },
                        text: "아이디 찾기",
                      ),
                      const SizedBox(width: 8),
                      const OrbText(
                        "|",
                      ),
                      const SizedBox(width: 8),
                      OrbTextButton(
                        onPressed: () {
                          ref
                              .read(routerServiceProvider)
                              .push(const FindPasswordRoute());
                        },
                        text: "비밀번호 찾기",
                      ),
                      const SizedBox(width: 8),
                      const OrbText(
                        "|",
                      ),
                      const SizedBox(width: 8),
                      OrbTextButton(
                        onPressed: () {
                          ref
                              .read(routerServiceProvider)
                              .push(const SignUpRoute());
                        },
                        text: "회원가입",
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
