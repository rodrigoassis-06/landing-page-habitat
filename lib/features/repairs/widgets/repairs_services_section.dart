import 'package:flutter/material.dart';

class RepairsServicesSection extends StatelessWidget {
  const RepairsServicesSection({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Linha decorativa
              Container(width: 40, height: 3, color: Colors.black),
              const SizedBox(height: 16),

              // Título
              Text(
                'O que consertamos',
                style: tt.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Subtítulo
              Text(
                'Do vazamento ao motor — resolvemos qualquer problema com agilidade e garantia.',
                style: tt.bodyLarge?.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 48),

              // Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;

                  return Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildServiceCard(
                        context,
                        icon: Icons.home_repair_service_outlined,
                        title: 'Detecção de Vazamentos',
                        description:
                            'Localização precisa de vazamentos estruturais e em tubulações com tecnologia de pressão e inspeção visual.',
                        isMobile: isMobile,
                      ),
                      SizedBox(
                        width: isMobile ? 0 : 20,
                        height: isMobile ? 20 : 0,
                      ),
                      _buildServiceCard(
                        context,
                        icon: Icons.build_outlined,
                        title: 'Reparo de Bombas e Motores',
                        description:
                            'Diagnóstico e reparo de bombas, motores e sistemas de circulação com peças originais e garantia.',
                        isMobile: isMobile,
                      ),
                      SizedBox(
                        width: isMobile ? 0 : 20,
                        height: isMobile ? 20 : 0,
                      ),
                      _buildServiceCard(
                        context,
                        icon: Icons.filter_alt_outlined,
                        title: 'Substituição de Filtros',
                        description:
                            'Substituição e recondicionamento de filtros de areia, cartucho e diatomáceas para máxima filtragem.',
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

  Widget _buildServiceCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required bool isMobile,
  }) {
    final cardContent = Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF181818),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );

    return isMobile ? cardContent : Expanded(child: cardContent);
  }
}
