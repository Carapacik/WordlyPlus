import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';

class LanguageSelector<T extends Locale> extends StatelessWidget {
  const LanguageSelector({
    required this.title,
    required this.value,
    required this.items,
    required this.onTap,
    super.key,
  });

  final String title;
  final T value;
  final List<T> items;
  final ValueChanged<T> onTap;

  @override
  Widget build(BuildContext context) => MergeSemantics(
        child: ListTileTheme.merge(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: Text(title, style: context.theme.bl),
            trailing: Text(value.toString(), style: context.theme.bl),
            onTap: () async {
              final selected = await _selectLanguageBottomSheet(context);
              if (selected == null) {
                return;
              }
              onTap(selected);
            },
          ),
        ),
      );

  Future<T?> _selectLanguageBottomSheet(BuildContext context) async => showModalBottomSheet<T>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
        constraints: const BoxConstraints(maxWidth: 400),
        builder: (context) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text('aaa', style: context.theme.tm),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    items[index].toString(),
                    style: context.theme.bl,
                  ),
                  trailing: value == items[index] ? const Icon(Icons.check) : null,
                  onTap: () => Navigator.of(context).pop(items[index]),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      );
}
