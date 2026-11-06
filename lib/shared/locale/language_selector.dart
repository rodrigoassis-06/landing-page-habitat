import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniqswims_lp/shared/locale/locale_provider.dart';

class LanguageSelector extends ConsumerWidget {
  final bool compact;

  const LanguageSelector({super.key, this.compact = false});

  static const _locales = [
    Locale('en'),
    Locale('es'),
    Locale('pt', 'BR'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    final cs = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _locales.map((locale) {
        final isSelected = locale.languageCode == currentLocale.languageCode &&
            locale.countryCode == currentLocale.countryCode;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: compact ? 2 : 4),
          child: InkWell(
            onTap: () => ref.read(localeProvider.notifier).setLocale(locale),
            borderRadius: BorderRadius.circular(4),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: compact ? 6 : 8,
                vertical: compact ? 2 : 4,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? cs.primary : cs.onSurface.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(4),
                color: isSelected ? cs.primary.withOpacity(0.15) : Colors.transparent,
              ),
              child: Text(
                _flag(locale),
                style: TextStyle(fontSize: compact ? 12 : 14),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _flag(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return '🇺🇸';
      case 'es':
        return '🇪🇸';
      case 'pt':
        return '🇧🇷';
      default:
        return '';
    }
  }
}
