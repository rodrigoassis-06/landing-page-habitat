import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';

class RepairsWhySection extends StatelessWidget {
  const RepairsWhySection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      color: cs.surface,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 80,
        horizontal: isMobile ? 24 : 80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(context, cs, tt, l10n),
                  const SizedBox(height: 40),
                  _buildStats(context, cs, tt, l10n),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _buildText(context, cs, tt, l10n)),
                  const SizedBox(width: 64),
                  Expanded(child: _buildStats(context, cs, tt, l10n)),
                ],
              ),
      ),
    );
  }

  Widget _buildText(BuildContext context, ColorScheme cs, TextTheme tt, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 4,
          color: cs.primary,
          margin: const EdgeInsets.only(bottom: 12),
        ),
        Text(
          l10n.repairsWhyTitle,
          style: tt.headlineMedium?.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          l10n.repairsWhyDesc1,
          style: tt.bodyLarge?.copyWith(
            color: cs.onSurface.withOpacity(0.75),
            height: 1.7,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.repairsWhyDesc2,
          style: tt.bodyLarge?.copyWith(
            color: cs.onSurface.withOpacity(0.75),
            height: 1.7,
          ),
        ),
      ],
    );
  }

  Widget _buildStats(BuildContext context, ColorScheme cs, TextTheme tt, AppLocalizations l10n) {
    final stats = [
      ('90%', l10n.repairsStatFirstVisit),
      ('48h', l10n.repairsStatResponse),
      ('100%', l10n.repairsStatWarranty),
      ('10+', l10n.repairsStatExperience),
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.8,
      children: stats.map((s) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cs.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: cs.onSurface.withOpacity(0.06)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.$1,
                style: tt.headlineSmall?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                s.$2,
                style: tt.bodySmall?.copyWith(
                  color: cs.onSurface.withOpacity(0.65),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}