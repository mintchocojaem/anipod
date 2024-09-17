import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class UserProfileEditScreen extends StatelessWidget {
  const UserProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      appBar: OrbAppBar(
        title: '계정 관리 ',
        centerTitle: true,
        trailing: OrbFilledButton(
          text: '완료',
          buttonSize: OrbButtonSize.compact,
          backgroundColor: Colors.transparent,
          foregroundColor: context.palette.surfaceDim,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: context.palette.primary,
                      child: OrbIcon(
                        Icons.camera_alt,
                        size: OrbIconSize.small,
                        color: context.palette.background,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            OrbText(
              '이름',
            ),
            const SizedBox(height: 8),
            OrbTextField(
              hintText: '이름을 입력해주세요',
            ),
            const SizedBox(height: 24),
            OrbText(
              '이메일',
            ),
            const SizedBox(height: 8),
            OrbTextField(
              hintText: '이메일을 입력해주세요',
            ),
            const SizedBox(height: 24),
            OrbText(
              '전화번호',
            ),
            const SizedBox(height: 8),
            OrbTextField(
              hintText: '전화번호를 입력해주세요',
            ),
          ],
        ),
      ),
    );
  }
}
