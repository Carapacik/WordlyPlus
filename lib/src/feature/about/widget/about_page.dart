import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:wordly/src/core/common/extensions/context_extension.dart';
import 'package:wordly/src/core/common/extensions/theme_extension.dart';
import 'package:wordly/src/core/constant/application_config.dart';
import 'package:wordly/src/feature/components/widget/constraint_screen.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: context.l10n.about,
      child: Scaffold(
        backgroundColor: context.theme.extension<BackgroundCustomColors>()?.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(context.l10n.about, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32)),
        ),
        body: ConstraintScreen(
          child: Column(
            children: [
              const Spacer(),
              const Text('Carapacik Space', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const _CreditNameText(text: 'Roman Laptev - Carapacik', url: 'https://carapacik.github.io'),
              const Spacer(flex: 10),
              Link(
                uri: Uri.parse(
                  'mailto:${const ApplicationConfig().email}?'
                  '${context.l10n.sendMessage}',
                ),
                builder: (context, followLink) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: followLink,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(text: context.l10n.contact),
                          WidgetSpan(
                            child: SelectableText(
                              const ApplicationConfig().email,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                context.dependencies.packageInfo.version,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreditNameText extends StatelessWidget {
  const _CreditNameText({required this.text, required this.url});

  final String text;
  final String url;

  @override
  Widget build(BuildContext context) => Link(
    uri: Uri.parse(url),
    builder: (context, followLink) => MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: followLink,
        behavior: HitTestBehavior.opaque,
        child: Text(text, style: const TextStyle(fontSize: 20, decoration: TextDecoration.underline)),
      ),
    ),
  );
}
