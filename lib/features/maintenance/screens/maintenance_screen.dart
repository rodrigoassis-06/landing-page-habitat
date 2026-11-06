import 'package:flutter/material.dart';
import 'package:uniqswims_lp/features/maintenance/widgets/maintenance_hero_section.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MaintenanceHeroSection(),
            MaintenanceIncludedSection(),
            WhyUniqMaintenanceSection(),
          ],
        ),
      ),
    );
  }
}

// ====================================================
// 1. SEÇÃO HERO / TOPO (com services2.jpg)
// ====================================================
class MaintenanceHeroSection extends StatelessWidget {
  const MaintenanceHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 900;

              return Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black87),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'MANUTENÇÃO DE PISCINAS',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Cristalina,\nToda Semana.',
                          style: tt.displaySmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Manutenção completa e recorrente para manter sua piscina impecável — química, limpeza, filtros e relatório de qualidade.',
                          style: tt.bodyLarge?.copyWith(
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 40 : 0),
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/services2.jpg',
                        fit: BoxFit.cover,
                        height: isMobile ? 300 : 420,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 300,
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                                size: 48,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ====================================================
// 2. SEÇÃO O QUE ESTÁ INCLUSO (com capa.jpg)
// ====================================================
class MaintenanceIncludedSection extends StatelessWidget {
  const MaintenanceIncludedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 4,
                color: Colors.black,
                margin: const EdgeInsets.only(bottom: 16),
              ),
              Text(
                'O que está incluso',
                style: tt.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Cada visita cobre todos os pontos essenciais para uma piscina saudável.',
                style: tt.bodyLarge?.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 32),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: double.infinity,
                  height: 320,
                  child: Image.asset(
                    'assets/images/capa.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                            size: 48,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;
                  return Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFeatureCard(
                        icon: Icons.water_drop_outlined,
                        title: 'Equilíbrio Químico',
                        description:
                            'Análise e ajuste de pH, cloro, alcalinidade e outros parâmetros para água segura e cristalina.',
                        isMobile: isMobile,
                      ),
                      SizedBox(
                        width: isMobile ? 0 : 16,
                        height: isMobile ? 16 : 0,
                      ),
                      _buildFeatureCard(
                        icon: Icons.cleaning_services_outlined,
                        title: 'Limpeza Profunda',
                        description:
                            'Escovação de paredes, aspiração do fundo e limpeza de linha d\'água com produtos premium.',
                        isMobile: isMobile,
                      ),
                      SizedBox(
                        width: isMobile ? 0 : 16,
                        height: isMobile ? 16 : 0,
                      ),
                      _buildFeatureCard(
                        icon: Icons.settings_outlined,
                        title: 'Filtros e Equipamentos',
                        description:
                            'Limpeza e inspeção de filtros, bombas e sistemas de circulação para máxima eficiência.',
                        isMobile: isMobile,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isMobile,
  }) {
    final cardContent = Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );

    return isMobile ? cardContent : Expanded(child: cardContent);
  }
}

// ====================================================
// 3. SEÇÃO POR QUE UNIQ (com trusted_partner.jpg)
// ====================================================
class WhyUniqMaintenanceSection extends StatelessWidget {
  const WhyUniqMaintenanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 900;

              return Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 4,
                          color: Colors.black,
                          margin: const EdgeInsets.only(bottom: 16),
                        ),
                        Text(
                          'Por que UNIQ Manutenção?',
                          style: tt.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Não somos apenas um serviço de limpeza. Somos parceiros na saúde da sua piscina — com tecnologia, consistência e profissionais certificados.',
                          style: tt.bodyLarge?.copyWith(
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Cada visita é documentada digitalmente. Você recebe um relatório com fotos, parâmetros e histórico completo — total transparência.',
                          style: tt.bodyLarge?.copyWith(
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 2.2,
                          children: const [
                            _StatCard(
                              value: '500+',
                              label: 'Piscinas atendidas',
                            ),
                            _StatCard(
                              value: '98%',
                              label: 'Taxa de satisfação',
                            ),
                            _StatCard(value: '5★', label: 'Avaliação média'),
                            _StatCard(
                              value: '24h',
                              label: 'Suporte de emergência',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 40 : 0),
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/trusted_partner.jpg',
                        fit: BoxFit.cover,
                        height: isMobile ? 320 : 460,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 320,
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                                size: 48,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
