import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wordly/bloc/theme/theme_bloc.dart';
import 'package:wordly/resources/resources.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    required this.text,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String text;
  final String value;
  final ValueChanged<String?> onChanged;

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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color:
                isHighContrast ? AppColors.highContrastOrange : AppColors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              alignment: Alignment.bottomCenter,
              value: value,
              borderRadius: BorderRadius.circular(10),
              items: [
                DropdownMenuItem(
                  value: 'ru',
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Assets.svg.russia.path,
                        width: 30,
                        height: 25,
                      ),
                      const SizedBox(width: 10),
                      Text('RU', style: context.theme.bl),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'en',
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Assets.svg.us.path,
                        width: 30,
                        height: 25,
                      ),
                      const SizedBox(width: 10),
                      Text('EN', style: context.theme.bl),
                    ],
                  ),
                ),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
