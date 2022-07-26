import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordly/bloc/theme/theme_bloc.dart';
import 'package:wordly/resources/resources.dart';

class ToggleListTile extends StatelessWidget {
  const ToggleListTile({
    required this.text,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final isHighContrast = context.read<ThemeBloc>().state.isHighContrast;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: context.theme.ll,
        ),
        Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeTrackColor:
              isHighContrast ? AppColors.highContrastOrange : AppColors.green,
          inactiveTrackColor: AppColors.grey,
          activeColor: Colors.white,
        ),
      ],
    );
  }
}
