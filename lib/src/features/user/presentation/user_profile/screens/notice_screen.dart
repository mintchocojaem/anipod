import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

@RoutePage()
class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      appBar: OrbAppBar(
        title: '공지사항',
        centerTitle: true,
      ),
      disableSafeAreaBottom: true,
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 16),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: OrbText(
                    '공지사항\n제목',
                    type: OrbTextType.bodyMedium,
                    fontWeight: OrbFontWeight.medium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                OrbText(
                  '2021.09.01',
                  type: OrbTextType.bodySmall,
                  color: context.palette.surfaceDim,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const OrbDivider(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
