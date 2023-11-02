import 'package:flutter/material.dart';
import 'package:wordly/src/core/utils/extensions/extensions.dart';

class ListItemSelector<T> extends StatelessWidget {
  const ListItemSelector({
    required this.title,
    required this.currentValue,
    required this.items,
    required this.onChange,
    super.key,
  });

  final String title;
  final (T, String) currentValue;
  final List<(T, String)> items;
  final ValueChanged<T> onChange;

  @override
  Widget build(BuildContext context) => MergeSemantics(
        child: ListTileTheme.merge(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: Text(title, style: context.theme.bl),
            trailing: Text(currentValue.$2, style: context.theme.bl),
            onTap: () async {
              final selected = await _selectLanguageBottomSheet(context);
              if (selected == null) {
                return;
              }
              onChange(selected);
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
              Text(title, style: context.theme.tm),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    items[index].$2,
                    style: context.theme.bl,
                  ),
                  trailing: currentValue.$1 == items[index].$1 ? const Icon(Icons.check) : null,
                  onTap: () => Navigator.of(context).pop(items[index].$1),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      );
}
