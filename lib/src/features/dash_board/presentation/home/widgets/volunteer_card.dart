import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class VolunteerCard extends StatelessWidget {
  final String title;
  final String organizationName;
  final String region;
  final String registrationDate;
  final String imagePlaceholder;
  final String duration;

  const VolunteerCard({
    super.key,
    required this.title,
    required this.organizationName,
    required this.region,
    required this.registrationDate,
    required this.imagePlaceholder,
    required this.duration,
  });

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: context.palette.surfaceBright,
            borderRadius: BorderRadius.circular(12),
          ),
          child: imagePlaceholder.isNotEmpty
              ? Image.network(imagePlaceholder, fit: BoxFit.cover)
              : Center(
                  child: OrbIcon(
                    Icons.image,
                  ),
                ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: context.palette.surfaceDim,
              borderRadius: BorderRadius.circular(12),
            ),
            child: OrbText(
              duration,
              type: OrbTextType.bodySmall,
              color: context.palette.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, String labelText, String value) {
    return Row(
      children: [
        OrbText(
          labelText,
          fontWeight: OrbFontWeight.medium,
          color: context.palette.surface,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: OrbText(
            value,
            maxLines: 1,
            fontWeight: OrbFontWeight.medium,
            overflow: TextOverflow.ellipsis,
            color: context.palette.surfaceDim,
          ),
        ),
      ],
    );
  }

  Widget _buildTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        OrbText(
          title,
          type: OrbTextType.bodyLarge,
          fontWeight: OrbFontWeight.bold,
          maxLines: 1,
        ),
        SizedBox(height: 4),
        _buildRow(context, '단체명:', organizationName),
        _buildRow(context, '지역:', region),
        _buildRow(context, '등록일:', registrationDate),
      ],
    );
  }

  Widget _buildNewIndicator(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: context.palette.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: OrbText(
          'NEW',
          type: OrbTextType.bodySmall,
          color: context.palette.onSecondary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 250,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageSection(context),
                _buildTextSection(context),
              ],
            ),
          ),
          _buildNewIndicator(context),
        ],
      ),
    );
  }
}
