import 'package:anipod/src/core/utils/date_time_formatter.dart';
import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class VolunteerListItem extends StatelessWidget with DateTimeFormatter {
  final String title;
  final String organization;
  final List<String> photos;
  final String region;
  final String registrationDate;
  final String duration;
  final Function()? onTap;
  final Function(bool isLiked)? onTapLike;

  const VolunteerListItem({
    super.key,
    required this.title,
    required this.organization,
    required this.photos,
    required this.region,
    required this.registrationDate,
    required this.duration,
    this.onTap,
    this.onTapLike,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: context.palette.background,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: context.palette.surfaceBright,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(photos.first),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: context.palette.surface,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: OrbText(
                        '+${photos.length}',
                        fontWeight: OrbFontWeight.medium,
                        color: context.palette.onSurface,
                        type: OrbTextType.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Text content section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrbText(
                      title,
                      type: OrbTextType.bodyMedium,
                      fontWeight: OrbFontWeight.medium,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SizedBox(
                          width: 36,
                          child: OrbText(
                            '단체명',
                            type: OrbTextType.bodySmall,
                            color: context.palette.surfaceDim,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OrbText(
                            organization,
                            type: OrbTextType.bodySmall,
                            color: context.palette.shadow,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SizedBox(
                          width: 36,
                          child: OrbText(
                            '지역',
                            type: OrbTextType.bodySmall,
                            color: context.palette.surfaceDim,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OrbText(
                            region,
                            type: OrbTextType.bodySmall,
                            color: context.palette.shadow,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SizedBox(
                          width: 36,
                          child: OrbText(
                            '등록일',
                            type: OrbTextType.bodySmall,
                            color: context.palette.surfaceDim,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OrbText(
                            dateFormatToCompact(registrationDate),
                            type: OrbTextType.bodySmall,
                            color: context.palette.shadow,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Like button and D-day section
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.palette.primary,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: OrbText(
                      duration,
                      type: OrbTextType.bodySmall,
                      color: context.palette.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
