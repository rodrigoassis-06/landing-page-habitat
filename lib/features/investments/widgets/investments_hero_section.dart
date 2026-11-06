import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';

class InvestmentsHeroSection extends StatelessWidget {
  const InvestmentsHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return SizedBox(
      height: isMobile ? 420 : 560,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/services1.jpeg', // Idealmente uma imagem mais corporate/lifestyle
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: cs.surface),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: cs.primary),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    l10n.investmentsBadge,
                    style: tt.labelSmall?.copyWith(
                      color: cs.primary,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.investmentsHeroTitle,
                  style: (isMobile ? tt.headlineLarge : tt.displayMedium)
                      ?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Text(
                    l10n.investmentsHeroDesc,
                    style: tt.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.85),
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}