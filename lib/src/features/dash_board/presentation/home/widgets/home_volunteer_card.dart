import 'package:anipod/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/orb/orb.dart';

class HomeVolunteerCard extends StatelessWidget {
  final String title;
  final String organizationName;
  final String region;
  final String registrationDate;
  final String? imageUrl;
  final String duration;

  const HomeVolunteerCard({
    super.key,
    required this.title,
    required this.organizationName,
    required this.region,
    required this.registrationDate,
    required this.imageUrl,
    required this.duration,
  });

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 156,
          height: 128,
          decoration: BoxDecoration(
            color: context.palette.surfaceBright,
            borderRadius: BorderRadius.circular(12),
            image: imageUrl != null
                ? DecorationImage(
                    image: NetworkImage(
                      imageUrl!,
                    ),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      print('Image loading error: $exception');
                    },
                  )
                : null,
          ),
          child: imageUrl == null
              ? Center(
                  child: Icon(
                    Icons.volunteer_activism,
                    color: context.palette.surfaceDim,
                  ),
                )
              : null,
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: context.palette.surfaceDim,
              borderRadius: BorderRadius.circular(12),
            ),
            child: OrbText(
              duration,
              type: OrbTextType.bodySmall,
              color: context.palette.onSurface,
              fontWeight: OrbFontWeight.medium,
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
          color: context.palette.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: OrbText(
          'NEW',
          type: OrbTextType.bodySmall,
          fontWeight: OrbFontWeight.medium,
          color: context.palette.onPrimary,
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
