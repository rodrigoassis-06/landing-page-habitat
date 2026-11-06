import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';

class InvestmentsWhySection extends StatelessWidget {
  const InvestmentsWhySection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      color: cs.surface,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Column(
          children: [
            Text(
              l10n.investmentsWhyTitle,
              style: tt.headlineSmall?.copyWith(color: cs.onSurface, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            _buildReason(context, l10n.investmentsWhyRecurringRevenue, l10n.investmentsWhyRecurringRevenueDesc),
            _buildReason(context, l10n.investmentsWhyProprietaryTech, l10n.investmentsWhyProprietaryTechDesc),
            _buildReason(context, l10n.investmentsWhyInelasticDemand, l10n.investmentsWhyInelasticDemandDesc),
          ],
        ),
      ),
    );
  }

  Widget _buildReason(BuildContext context, String title, String desc) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, color: cs.primary, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: tt.titleMedium?.copyWith(color: cs.onSurface, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc, style: tt.bodyMedium?.copyWith(color: cs.onSurface.withOpacity(0.7))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}