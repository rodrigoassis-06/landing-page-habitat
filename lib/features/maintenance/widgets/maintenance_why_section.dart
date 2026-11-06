import 'package:flutter/material.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';

class MaintenanceWhySection extends StatelessWidget {
  const MaintenanceWhySection({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      color: Colors.white, // Fundo em BRANCO
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 80,
        horizontal: isMobile ? 24 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(context, tt, l10n),
                    const SizedBox(height: 32),
                    _buildImage8(isMobile), // Imagem 8
                    const SizedBox(height: 36),
                    _buildStats(context, tt, l10n),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Coluna da Esquerda: Textos em PRETO
                    Expanded(flex: 5, child: _buildText(context, tt, l10n)),
                    const SizedBox(width: 64),

                    // Coluna da Direita: Imagem 8 + Cards de Métricas
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          _buildImage8(isMobile), // Imagem 8
                          const SizedBox(height: 32),
                          _buildStats(context, tt, l10n),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // Widget dedicado para a IMAGEM 8
  Widget _buildImage8(bool isMobile) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        height: isMobile ? 220 : 280,
        width: double.infinity,
        child: Image.asset(
          'assets/images/services8.jpeg', // Arquivo referente à Imagem 8
          fit: BoxFit.cover,
          alignment: Alignment.center,
          errorBuilder: (_, __, ___) => Container(
            color: Colors.grey[200],
            child: const Icon(Icons.pool, size: 48, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  // Bloco de Textos com fonte PRETA
  Widget _buildText(BuildContext context, TextTheme tt, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Linha decorativa minimalista
        Container(
          width: 64,
          height: 4,
          color: Colors.black,
          margin: const EdgeInsets.only(bottom: 16),
        ),

        // Título em PRETO
        Text(
          l10n.maintenanceWhyTitle,
          style: tt.headlineMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        // Descrições em PRETO / CINZA ESCURO
        Text(
          l10n.maintenanceWhyDesc1,
          style: tt.bodyLarge?.copyWith(color: Colors.black87, height: 1.7),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.maintenanceWhyDesc2,
          style: tt.bodyLarge?.copyWith(color: Colors.black87, height: 1.7),
        ),
      ],
    );
  }

  // Grid de Estatísticas em Cards PRETO com texto BRANCO
  Widget _buildStats(
    BuildContext context,
    TextTheme tt,
    AppLocalizations l10n,
  ) {
    final stats = [
      ('500+', l10n.maintenanceStatPools),
      ('98%', l10n.maintenanceStatSatisfaction),
      ('5★', l10n.maintenanceStatRating),
      ('24h', l10n.maintenanceStatSupport),
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
            color: Colors.black, // Cards em PRETO
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.white12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.$1,
                style: tt.headlineSmall?.copyWith(
                  color: Colors.white, // Números em BRANCO
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                s.$2,
                style: tt.bodySmall?.copyWith(
                  color: Colors.white70, // Descrição em BRANCO/CINZA CLARO
                ),
              ),
            ],
          ),
        );

      }).toList(),
    );
  }
}
