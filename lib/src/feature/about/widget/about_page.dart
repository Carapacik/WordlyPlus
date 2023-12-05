import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:wordly/src/core/constants/constants.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';
import 'package:wordly/src/feature/components/widget/constraint_screen.dart';
import 'package:wordly/src/feature/settings/model/app_theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: context.r.about,
      child: Scaffold(
        backgroundColor: context.theme.extension<BackgroundCustomColors>()?.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.r.about,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
          ),
        ),
        body: ConstraintScreen(
          child: Column(
            children: [
              const Spacer(),
              const Text('Carapacik Space', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const _CreditNameText(text: 'Roman Laptev - Carapacik', url: 'https://carapacik.github.io/'),
              const _CreditNameText(text: 'Dmitriy Lukyanov (Design)', url: 'https://t.me/kamalledln'),
              const Spacer(flex: 10),
              Link(
                uri: Uri.parse(
                  'mailto:$email?'
                  '${context.r.sendMessage}',
                ),
                builder: (context, followLink) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: followLink,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(text: context.r.contact),
                          const WidgetSpan(
                            child: SelectableText(
                              email,
                              style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}

class _CreditNameText extends StatelessWidget {
  const _CreditNameText({
    required this.text,
    required this.url,
  });

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
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, decoration: TextDecoration.underline),
            ),
          ),
        ),
      );
}
