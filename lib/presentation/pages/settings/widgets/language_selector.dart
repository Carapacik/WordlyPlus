import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    Key? key,
    required this.text,
    required this.value,
    required this.onChanged,
    required this.isHighContrast,
  }) : super(key: key);

  final String text;
  final String value;
  final bool isHighContrast;
  final ValueChanged<String?> onChanged;

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
                  value: "ru",
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        R.svg.russia,
                        width: 30,
                        height: 25,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "RU",
                        style: AppTypography.m16,
                      ),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: "en",
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        R.svg.us,
                        width: 30,
                        height: 25,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "EN",
                        style: AppTypography.m16,
                      ),
                    ],
                  ),
                ),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
