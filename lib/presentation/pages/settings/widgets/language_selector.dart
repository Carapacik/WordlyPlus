import 'package:flutter/material.dart';
import 'package:wordly/data/models.dart';
import 'package:wordly/resources/resources.dart';

class LanguageSelector<T extends GetNameEnumMixin> extends StatelessWidget {
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
  final ValueChanged<T?> onTap;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: ListTileTheme.merge(
        selectedColor: AppColors.green,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Text(title, style: context.theme.ll),
          trailing: Text(value.getName(context), style: context.theme.bl),
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
  }

  Future<T?> _selectLanguageBottomSheet(BuildContext context) async {
    return showModalBottomSheet<T>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      constraints: const BoxConstraints(maxWidth: 400),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(context.r.select_language, style: context.theme.tm),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.of(context).pop(items[index]),
                    child: ListTile(
                      title: Text(
                        items[index].getName(context),
                        style: context.theme.bl,
                      ),
                      trailing: value == items[index]
                          ? const Icon(Icons.check)
                          : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
