import 'package:anipod/src/core/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';
import '../widgets/user_activity_card.dart';

class RankItem {
  final String title;
  final String color;
  final String content;

  RankItem({
    required this.title,
    required this.color,
    required this.content,
  });
}

@RoutePage()
class UserRankScreen extends StatelessWidget {
  const UserRankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ranks = [
      RankItem(
        title: '그레이팟',
        color: 'gray',
        content: '봉사횟수, 후원이 1번 이상',
      ),
      RankItem(
        title: '그릿팟',
        color: 'green',
        content: '봉사횟수, 후원이 2번 이상',
      ),
      RankItem(
        title: '옐로우팟',
        color: 'yellow',
        content: '봉사횟수, 후원이 3번 이상',
      ),
      RankItem(
        title: '블루팟',
        color: 'blue',
        content: '봉사횟수, 후원이 4번 이상',
      ),
    ];
    return OrbScaffold(
      appBar: OrbAppBar(
        title: '등급',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Image.asset(
              'assets/images/green_pod.png',
              scale: 0.6,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            OrbText(
              '그릿팟',
              type: OrbTextType.titleMedium,
              fontWeight: OrbFontWeight.medium,
            ),
            const SizedBox(
              height: 24,
            ),
            UserActivityCard(
              items: [
                UserActivityItem(
                  title: '봉사시간',
                  content: '1000',
                ),
                UserActivityItem(
                  title: '봉사횟수',
                  content: '3',
                ),
                UserActivityItem(
                  title: '후원',
                  content: '3',
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              height: 8,
              decoration: BoxDecoration(
                color: context.palette.secondary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.palette.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            OrbText(
              '다음 등급까지 1000점 남았습니다.',
              type: OrbTextType.bodyMedium,
              fontWeight: OrbFontWeight.medium,
            ),
            const SizedBox(
              height: 24,
            ),
            OrbDivider(),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/${ranks[index].color}_pod.png',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrbText(
                            ranks[index].title,
                            type: OrbTextType.titleSmall,
                            fontWeight: OrbFontWeight.medium,
                          ),
                          const SizedBox(height: 4),
                          OrbText(
                            ranks[index].content,
                            type: OrbTextType.bodyMedium,
                            fontWeight: OrbFontWeight.medium,
                            color: context.palette.surfaceDim,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
