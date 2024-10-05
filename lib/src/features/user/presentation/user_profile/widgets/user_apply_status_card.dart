import 'package:anipod/src/core/utils/extensions.dart';
import 'package:anipod/src/design_system/orb/orb.dart';
import 'package:flutter/material.dart';

import '../../../../board/domain/models/volunteer_apply_board.dart';

class UserApplyStatusCard extends StatelessWidget {
  final String title;
  final String organization;
  final String location;
  final String registeredDate;
  final VolunteerApplyStatusModel applyStatus;
  final VoidCallback onTap;

  const UserApplyStatusCard({
    super.key,
    required this.title,
    required this.organization,
    required this.location,
    required this.registeredDate,
    required this.applyStatus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String getStatusMessage(VolunteerApplyStatusModel status) {
      switch (status) {
        case VolunteerApplyStatusModel.waiting:
          return '현재 접수 상태입니다. 승인을 기다려주세요';
        case VolunteerApplyStatusModel.accepted:
          return '현재 승인 상태입니다. 방문 확정을 기다려주세요';
        case VolunteerApplyStatusModel.rejected:
          return '승인이 거절되었습니다';
        case VolunteerApplyStatusModel.visited:
          return '방문이 완료되었습니다';
        case VolunteerApplyStatusModel.completed:
          return '봉사활동이 완료되었습니다';
      }
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.palette.background,
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildProgressBar(applyStatus, context),
          const SizedBox(height: 16),
          Center(
            child: OrbText(
              getStatusMessage(applyStatus),
              type: OrbTextType.bodySmall,
              color: context.palette.surfaceDim,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OrbFilledButton(
              onPressed: onTap,
              buttonSize: OrbButtonSize.fit,
              buttonRadius: OrbButtonRadius.small,
              text: '자세히 보기',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: context.palette.surfaceBright,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrbText(
                title,
                type: OrbTextType.bodyLarge,
                fontWeight: OrbFontWeight.medium,
              ),
              const SizedBox(height: 4),
              _buildDetailRow('단체명', organization, context),
              _buildDetailRow('지역', location, context),
              _buildDetailRow('등록일', registeredDate, context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: OrbText(
              label,
              type: OrbTextType.bodySmall,
              color: context.palette.surfaceDim,
            ),
          ),
          const SizedBox(width: 8),
          OrbText(
            value,
            type: OrbTextType.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(
      VolunteerApplyStatusModel status, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: double.infinity,
                    height: 2,
                    color: context.palette.secondary,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(VolunteerApplyStatusModel.values.length,
                    (index) {
                  return CircleAvatar(
                    radius: 8,
                    backgroundColor: index <= status.index
                        ? context.palette.primary
                        : context.palette.secondary,
                  );
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                List.generate(VolunteerApplyStatusModel.values.length, (index) {
              final step = VolunteerApplyStatusModel.values[index];
              return Column(
                children: [
                  const SizedBox(height: 4),
                  OrbText(
                    step.displayName,
                    type: OrbTextType.bodySmall,
                    color: step == status
                        ? context.palette.primary
                        : context.palette.surfaceDim,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
