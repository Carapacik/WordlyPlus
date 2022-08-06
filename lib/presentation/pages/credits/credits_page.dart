import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';

class CreditPeople {
  const CreditPeople(this.name, this.url);

  final String name;
  final String url;
}

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  static const email = 'carapacik@gmail.com';

  static const rofl = [
    CreditPeople('Carapacik', 'https://github.com/Carapacik')
  ];

  static const gameDesign = [
    CreditPeople('Carapacik', 'https://github.com/Carapacik'),
    CreditPeople('Sancene', 'https://github.com/Sancene'),
  ];

  static const visualDesign = [
    CreditPeople('Carapacik', 'https://github.com/Carapacik'),
    CreditPeople('Mary Wilson', 'https://www.behance.net/bugagam'),
  ];

  static const dictionary = [
    CreditPeople('Carapacik', 'https://github.com/Carapacik'),
    CreditPeople('Alex Dekhant', 'https://github.com/Dekhant'),
  ];

  @override
  Widget build(BuildContext context) => Title(
        color: AppColors.darkBg,
        title: context.r.about,
        child: Scaffold(
          appBar: CustomAppBar(
            title: context.r.about,
          ),
          body: ConstraintScreen(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  _CreditCategory(
                    title: context.r.created_by,
                    peoples: rofl,
                  ),
                  _CreditCategory(
                    title: context.r.game_design,
                    peoples: gameDesign,
                  ),
                  _CreditCategory(
                    title: context.r.visual_design,
                    peoples: visualDesign,
                  ),
                  _CreditCategory(
                    title: context.r.dictionary,
                    peoples: dictionary,
                  ),
                  const Spacer(),
                  Link(
                    uri: Uri.parse(
                      'mailto:$email?'
                      '${context.r.message_new_word}',
                    ),
                    builder: (context, followLink) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: followLink,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: context.r.contact,
                                style: context.theme.bl,
                              ),
                              WidgetSpan(
                                child: SelectableText(
                                  email,
                                  style: context.theme.tm.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      );
}

class _CreditCategory extends StatelessWidget {
  const _CreditCategory({
    required this.title,
    required this.peoples,
  });

  final String title;
  final List<CreditPeople> peoples;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: context.theme.tm),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) => Center(
              child: _CreditNameText(
                text: peoples[index].name,
                url: peoples[index].url,
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemCount: peoples.length,
          ),
          const SizedBox(height: 8),
        ],
      );
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
              style: context.theme.tm
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ),
      );
}
