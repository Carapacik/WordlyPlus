import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:wordly/presentation/pages/about/models/credit_people.dart';
import 'package:wordly/presentation/widgets/widgets.dart';
import 'package:wordly/resources/resources.dart';
import 'package:wordly/utils/utils.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static const rofl = [
    CreditPeople("Carapacik", "https://github.com/Carapacik")
  ];

  static const gameDesign = [
    CreditPeople("Carapacik", "https://github.com/Carapacik"),
    CreditPeople("Sancene", "https://github.com/Sancene"),
  ];

  static const visualDesign = [
    CreditPeople("Carapacik", "https://github.com/Carapacik"),
    CreditPeople("Mary Wilson", "https://www.behance.net/bugagam"),
  ];

  static const dictionary = [
    CreditPeople("Carapacik", "https://github.com/Carapacik"),
    CreditPeople("Alex Dekhant", "https://github.com/Dekhant"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: R.stringsOf(context).about,
      ),
      body: ConstraintScreen(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              _CreditCategory(
                title: R.stringsOf(context).created_by,
                peoples: rofl,
              ),
              _CreditCategory(
                title: R.stringsOf(context).game_design,
                peoples: gameDesign,
              ),
              _CreditCategory(
                title: R.stringsOf(context).visual_design,
                peoples: visualDesign,
              ),
              _CreditCategory(
                title: R.stringsOf(context).dictionary,
                peoples: dictionary,
              ),
              _CreditCategory(
                title: R.stringsOf(context).scenario,
                peoples: rofl,
              ),
              Spacer(),
              Text(
                R.stringsOf(context).contact,
                style: AppTypography.m16,
                textAlign: TextAlign.center,
              ),
              Link(
                uri: Uri.parse("mailto:carapacik@gmail.com?subject=New%20word"),
                builder: (context, followLink) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: followLink,
                    behavior: HitTestBehavior.opaque,
                    child: Text(
                      "carapacik@gmail.com",
                      style: AppTypography.m18
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreditCategory extends StatelessWidget {
  const _CreditCategory({
    Key? key,
    required this.title,
    required this.peoples,
  }) : super(key: key);

  final String title;
  final List<CreditPeople> peoples;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTypography.b25,
        ),
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
}

class _CreditNameText extends StatelessWidget {
  const _CreditNameText({
    Key? key,
    required this.text,
    required this.url,
  }) : super(key: key);

  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      builder: (context, followLink) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: followLink,
          behavior: HitTestBehavior.opaque,
          child: Text(
            text,
            style: AppTypography.m18
                .copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}
