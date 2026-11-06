import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';

class InvestmentsOpportunitiesSection extends StatelessWidget {
  const InvestmentsOpportunitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      color: cs.background,
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 24 : 80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            Text(
              l10n.investmentsModelsTitle,
              style: tt.headlineMedium?.copyWith(
                color: cs.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            isMobile
                ? Column(
                    children: [
                      _buildInvestCard(context, l10n.investmentsRouteOwnership, l10n.investmentsRouteOwnershipDesc, l10n.investmentsRouteOwnershipBadge),
                      const SizedBox(height: 24),
                      _buildInvestCard(context, l10n.investmentsRegionalFranchise, l10n.investmentsRegionalFranchiseDesc, l10n.investmentsRegionalFranchiseBadge),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(child: _buildInvestCard(context, l10n.investmentsRouteOwnership, l10n.investmentsRouteOwnershipDesc, l10n.investmentsRouteOwnershipBadge)),
                      const SizedBox(width: 32),
                      Expanded(child: _buildInvestCard(context, l10n.investmentsRegionalFranchise, l10n.investmentsRegionalFranchiseDesc, l10n.investmentsRegionalFranchiseBadge)),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestCard(BuildContext context, String title, String desc, String badge) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.primary.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: cs.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
            child: Text(badge, style: tt.labelSmall?.copyWith(color: cs.primary, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          Text(title, style: tt.headlineSmall?.copyWith(color: cs.onSurface, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(desc, style: tt.bodyMedium?.copyWith(color: cs.onSurface.withOpacity(0.7), height: 1.6)),
        ],
      ),
    );
  }
}