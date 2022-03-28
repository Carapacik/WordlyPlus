import 'package:flutter/material.dart';
import 'package:wordly/resources/colors.dart';
import 'package:wordly/resources/typography.dart';

class ToggleListTile extends StatelessWidget {
  const ToggleListTile({
    Key? key,
    required this.text,
    required this.value,
    required this.isHighContrast,
    required this.onChanged,
  }) : super(key: key);

  final String text;
  final bool value;
  final bool isHighContrast;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          text,
          style: AppTypography.m16,
        ),
        const Spacer(),
        Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeTrackColor:
              isHighContrast ? AppColors.highContrastOrange : AppColors.green,
          inactiveTrackColor: AppColors.greyTrack,
          activeColor: Colors.white,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
