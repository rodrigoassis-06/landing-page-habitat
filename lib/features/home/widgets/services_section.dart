import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';

class ServicesSection extends StatelessWidget {
  final Key? sectionKey;
  final VoidCallback? onContactPressed;

  const ServicesSection({Key? key, this.sectionKey, this.onContactPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final tt = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;

    final services = [
      _ServiceItem(
        title: 'Construção de Identidade',
        description: 'Criamos marcas autorais, universo visual e posicionamento estratégico que transmitem valor imediato e constroem autoridade no seu mercado.',
        imagePath: 'assets/images/servico_identidade.jpg',
        alignment: Alignment.center,
        route: '/contact',
      ),
      _ServiceItem(
        title: 'Otimização de Processos',
        description: 'Mapeamos gargalos operacionais e desenhamos fluxos inteligentes com automações para economizar tempo, reduzir custos e acelerar sua entrega.',
        imagePath: 'assets/images/servico_processos.jpg',
        alignment: Alignment.center,
        route: '/contact',
      ),
      _ServiceItem(
        title: 'Sistemas Sob Medida',
        description: 'Desenvolvemos plataformas web, portais de clientes e ERPs/CRMs de ponta a ponta, projetados exatamente para as regras do seu cliente.',
        imagePath: 'assets/images/servico_sistemas.jpg',
        alignment: Alignment.center,
        route: '/contact',
      ),
      _ServiceItem(
        title: 'Suporte & Evolução',
        description: 'Garantimos acompanhamento técnico contínuo, monitoramento, melhorias constantes e sustentação para que seu ecossistema nunca pare.',
        imagePath: 'assets/images/image-6-hd.png',
        alignment: Alignment.center,
        route: '/contact',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final itemsToShow = _itemsForWidth(maxWidth);
        final viewportFraction = 1 / itemsToShow;
        final isMobile = maxWidth < 600;

        return Container(
          key: sectionKey,
          width: double.infinity,
          color: cs.background,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 36 : 72,
            horizontal: isMobile ? 20 : 48,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64,
                  height: 4,
                  color: cs.onSurface,
                  margin: const EdgeInsets.only(bottom: 12),
                ),
                Text(
                  l10n.servicesTitle,
                  style:
                      (tt.headlineMedium ??
                              const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ))
                          .copyWith(color: cs.onSurface),
                ),
                const SizedBox(height: 20),
                CarouselSlider.builder(
                  itemCount: services.length,
                  itemBuilder: (context, index, realIndex) {
                    final service = services[index];
                    return _ServiceCard(
                      title: service.title,
                      description: service.description,
                      imagePath: service.imagePath,
                      alignment: service.alignment,
                      route: service.route,
                      onTap: onContactPressed,
                      colorScheme: cs,
                      textTheme: tt,
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: viewportFraction,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: false,
                    height: itemsToShow == 1 ? 340 : 380,
                    padEnds: false,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int _itemsForWidth(double width) {
    if (width < 600) return 1;
    if (width < 1000) return 2;
    return 3;
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Alignment alignment;
  final String route;
  final VoidCallback? onTap;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _ServiceCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.alignment,
    required this.route,
    this.onTap,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap ?? () => context.go(route),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.onSurface.withOpacity(0.04)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: _buildImage(imagePath, alignment),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style:
                    (textTheme.titleLarge ??
                            const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ))
                        .copyWith(color: colorScheme.onSurface),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: (textTheme.bodyMedium ?? const TextStyle(fontSize: 14))
                    .copyWith(
                      color: colorScheme.onSurface.withOpacity(0.85),
                      height: 1.5,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String cardImgPath, Alignment imgAlignment) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
      child: Image.asset(
        cardImgPath,
        fit: BoxFit.cover,
        cacheWidth: 800,
        alignment: imgAlignment,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: colorScheme.surface,
            child: const Center(
              child: Icon(Icons.broken_image, color: Colors.white24, size: 48),
            ),
          );
        },
      ),
    );
  }
}

class _ServiceItem {
  final String title;
  final String description;
  final String imagePath;
  final Alignment alignment;
  final String route;

  const _ServiceItem({
    required this.title,
    required this.description,
    required this.imagePath,
    this.alignment = Alignment.center,
    required this.route,
  });
}
