import 'package:flutter/material.dart';
import 'package:wordly/presentation/pages/settings/widgets/language_selector.dart';
import 'package:wordly/presentation/pages/settings/widgets/toggle_list_tile.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.r.settings),
      body: ConstraintScreen(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 8),
              ToggleListTile(
                text: context.r.dark_mode,
                value: false,
                onChanged: (value) {},
                isHighContrast: false,
              ),
              const Divider(color: AppColors.grey),
              ToggleListTile(
                text: context.r.high_contrast_mode,
                value: false,
                onChanged: (value) {},
                isHighContrast: false,
              ),
              const Divider(color: AppColors.grey),
              LanguageSelector(
                text: context.r.app_language,
                value: '',
                onChanged: (value) {},
                isHighContrast: false,
              ),
              const Divider(color: AppColors.grey),
              LanguageSelector(
                text: context.r.dictionary_language,
                value: '',
                onChanged: (value) {},
                isHighContrast: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
