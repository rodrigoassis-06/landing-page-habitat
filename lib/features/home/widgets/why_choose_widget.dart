import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';

class WhyChooseWidget extends StatelessWidget {
  final Key? sectionKey;

  const WhyChooseWidget({Key? key, this.sectionKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final tt = theme.textTheme;
    final isMobile = MediaQuery.of(context).size.width < 768;
    final l10n = AppLocalizations.of(context)!;

    final reasons = [
      {
        "title": l10n.whyChooseSpecialized,
        "desc": l10n.whyChooseSpecializedDesc,
      },
      {
        "title": l10n.whyChooseInnovation,
        "desc": l10n.whyChooseInnovationDesc,
      },
      {
        "title": l10n.whyChooseLicensing,
        "desc": l10n.whyChooseLicensingDesc,
      },
    ];

    return Container(
      key: sectionKey,
      width: double.infinity,
      color: cs.background,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 36 : 80,
        horizontal: isMobile ? 20 : 48,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title + underline
            _buildTitle(cs, tt, isMobile, l10n),
            const SizedBox(height: 36),

            // Desktop: two columns (Reasons list | Phone mockup)
            // Mobile: stacked (Phone mockup then reasons)
            isMobile ? _buildMobileLayout(cs, tt, reasons) : _buildDesktopLayout(cs, tt, reasons),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(ColorScheme cs, TextTheme tt, bool isMobile, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // thin underline bar
        Container(
          width: 64,
          height: 4,
          color: cs.onSurface,
          margin: const EdgeInsets.only(bottom: 12),
        ),
        Text(
          l10n.whyChooseTitle,
          style: (tt.displayLarge ?? tt.headlineMedium ?? const TextStyle(fontSize: 36, fontWeight: FontWeight.w800))
              .copyWith(color: cs.onSurface, height: 1.1),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(ColorScheme cs, TextTheme tt, List<Map<String, dynamic>> reasons) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Reasons list (without side icons and with larger text)
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: reasons
                .map((r) => Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: _ListReasonItem(item: r, colorScheme: cs, textTheme: tt),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(width: 40),
        // Phone mockup on right side (ampliado)
        Expanded(
          flex: 5,
          child: Center(
            child: Image.asset(
              'assets/images/mockup_celular.png',
              fit: BoxFit.contain,
              height: 520,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(ColorScheme cs, TextTheme tt, List<Map<String, dynamic>> reasons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Image.asset(
            'assets/images/mockup_celular.png',
            fit: BoxFit.contain,
            height: 380,
          ),
        ),
        const SizedBox(height: 32),
        ...reasons
            .map((r) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: _ListReasonItem(item: r, colorScheme: cs, textTheme: tt),
                ))
            .toList(),
      ],
    );
  }
}

class _ListReasonItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _ListReasonItem({
    required this.item,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item['title'] as String,
          style: (textTheme.titleLarge ?? const TextStyle(fontSize: 22, fontWeight: FontWeight.w800))
              .copyWith(
                color: colorScheme.onSurface,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                height: 1.25,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          item['desc'] as String,
          style: (textTheme.bodyLarge ?? const TextStyle(fontSize: 17)).copyWith(
            color: colorScheme.onSurface.withOpacity(0.85),
            fontSize: 17,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
