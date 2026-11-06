import 'package:flutter/material.dart';

class RepairsHeroSection extends StatelessWidget {
  const RepairsHeroSection({super.key});

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
                  // Lado Esquerdo: Textos
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tag superior
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
                            'REPAROS DE PISCINAS',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Título principal
                        Text(
                          'Diagnóstico Rápido.\nConserto Garantido.',
                          style: tt.displaySmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Subtítulo / Descrição
                        Text(
                          'Diagnóstico rápido e reparos especializados em bombas, filtros, vazamentos e revestimentos — com solução garantida.',
                          style: tt.bodyLarge?.copyWith(
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 40 : 0),

                  // Lado Direito: Imagem 6 (Aerial Pool View)
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/image-6-hd.png', // ← Imagem 6 aplicada aqui
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
