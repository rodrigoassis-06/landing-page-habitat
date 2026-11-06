import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';

class MaintenanceServicesSection extends StatelessWidget {
  const MaintenanceServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1000;
    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    final items = [
      _ServiceFeature(
        icon: Icons.water_drop_outlined,
        title: l10n.maintenanceFeatureChemBalance,
        description: l10n.maintenanceFeatureChemBalanceDesc,
      ),
      _ServiceFeature(
        icon: Icons.cleaning_services_outlined,
        title: l10n.maintenanceFeatureDeepCleaning,
        description: l10n.maintenanceFeatureDeepCleaningDesc,
      ),
      _ServiceFeature(
        icon: Icons.settings_outlined,
        title: l10n.maintenanceFeatureFilter,
        description: l10n.maintenanceFeatureFilterDesc,
      ),
      _ServiceFeature(
        icon: Icons.assignment_outlined,
        title: l10n.maintenanceFeatureQualityReport,
        description: l10n.maintenanceFeatureQualityReportDesc,
      ),
      _ServiceFeature(
        icon: Icons.calendar_month_outlined,
        title: l10n.maintenanceFeatureScheduled,
        description: l10n.maintenanceFeatureScheduledDesc,
      ),
      _ServiceFeature(
        icon: Icons.shield_outlined,
        title: l10n.maintenanceFeaturePreventive,
        description: l10n.maintenanceFeaturePreventiveDesc,
      ),
    ];

    return Container(
      width: double.infinity,
      color: Colors.white, // 1. Fundo da Seção em BRANCO
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 80,
        horizontal: isMobile ? 24 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Linha decorativa minimalista em preto
              Container(
                width: 64,
                height: 4,
                color: Colors.black,
                margin: const EdgeInsets.only(bottom: 16),
              ),

              // Título principal em PRETO
              Text(
                l10n.maintenanceWhatIncluded,
                style: tt.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Subtítulo em PRETO
              Text(
                l10n.maintenanceWhatIncludedDesc,
                style: tt.bodyLarge?.copyWith(
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 36),

              // 2. Imagem 6 em Destaque
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: isMobile ? 220 : 360,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/services6.jpeg', // Insira aqui o arquivo correspondente à Imagem 6
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.pool, size: 48, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Grid de Cards PRETO com texto BRANCO
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isMobile ? 2.8 : 2.0,
                ),
                itemCount: items.length,
                itemBuilder: (context, i) => _FeatureCard(item: items[i]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final _ServiceFeature item;
  const _FeatureCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black, // 3. Cards em PRETO
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, color: Colors.white, size: 28), // Ícone em BRANCO
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  style: tt.titleSmall?.copyWith(
                    color: Colors.white, // Título do Card em BRANCO
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.description,
                  style: tt.bodySmall?.copyWith(
                    color: Colors.white70, // Descrição em BRANCO/CINZA CLARO
                    height: 1.5,
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

class _ServiceFeature {
  final IconData icon;
  final String title;
  final String description;
  const _ServiceFeature({
    required this.icon,
    required this.title,
    required this.description,
  });
}