import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesSection extends StatelessWidget {
  final Key? sectionKey;
  final VoidCallback? onContactPressed;

  const ServicesSection({
    Key? key,
    this.sectionKey,
    this.onContactPressed,
  }) : super(key: key);

  static const List<_ServiceStep> _steps = [
    _ServiceStep(
      number: '01',
      title: 'Observar',
      description: 'Entendemos seu negócio\ne o seu público.',
      tags: ['Diagnóstico', 'Mercado', 'Posicionamento'],
    ),
    _ServiceStep(
      number: '02',
      title: 'Rastrear',
      description: 'Mapeamos o que o seu\nprojeto precisa de\nverdade.',
      tags: ['Arquitetura', 'Jornada UX', 'Escopo Ágil'],
    ),
    _ServiceStep(
      number: '03',
      title: 'Desenhar',
      description: 'Criamos a marca, o site\nou o sistema sob medida.',
      tags: ['Branding', 'Sites & LPs', 'Sistemas Web'],
    ),
    _ServiceStep(
      number: '04',
      title: 'Lançar',
      description: 'Colocamos no ar e\nseguimos junto com\nvocê.',
      tags: ['Deploy Nuvem', 'Performance', 'Evolução Contínua'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final isTablet = MediaQuery.of(context).size.width < 1100 && !isMobile;

    return Container(
      key: sectionKey,
      width: double.infinity,
      color: const Color(0xFF0A0A0A),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 54 : 96,
        horizontal: isMobile ? 24 : 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Eyebrow com indicador laranja
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 2,
                    color: const Color(0xFFFF7A00),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'NOSSA METODOLOGIA & SERVIÇOS',
                    style: GoogleFonts.syne(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.5,
                      color: const Color(0xFFFF7A00),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Título Principal
              Text(
                'Como Construímos Seu Ecossistema',
                style: GoogleFonts.syne(
                  fontSize: isMobile ? 30 : 46,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.0,
                  color: Colors.white,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 14),

              // Subtítulo
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: Text(
                  'Da concepção estratégica ao software em produção, cada fase é planejada para gerar diferenciação, autoridade e tração real para sua marca.',
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 15 : 17,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFA1A1AA),
                    height: 1.6,
                  ),
                ),
              ),

              SizedBox(height: isMobile ? 44 : 64),

              // Grade de 4 Pilares (Desktop: 4 colunas com divisores verticais; Mobile: 1 ou 2 colunas)
              isMobile
                  ? _buildMobileGrid(context)
                  : _buildDesktopRow(context, isTablet),

              SizedBox(height: isMobile ? 40 : 56),

              // CTA Inferior
              Center(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onContactPressed,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF141414),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0x33FF7A00),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'QUERO CONSTRUIR MEU PROJETO',
                            style: GoogleFonts.syne(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: Color(0xFFFF7A00),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopRow(BuildContext context, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D0D),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0x1AFFFFFF),
          width: 1,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _steps.asMap().entries.map((entry) {
            final idx = entry.key;
            final step = entry.value;
            final isLast = idx == _steps.length - 1;

            return Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: isLast
                        ? BorderSide.none
                        : const BorderSide(
                            color: Color(0x28FF7A00), // Divisor âmbar sutil como no anexo
                            width: 1,
                          ),
                  ),
                ),
                child: _PillarCard(
                  step: step,
                  onTap: onContactPressed,
                  padding: EdgeInsets.all(isTablet ? 24 : 36),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMobileGrid(BuildContext context) {
    return Column(
      children: _steps.asMap().entries.map((entry) {
        final idx = entry.key;
        final step = entry.value;
        final isLast = idx == _steps.length - 1;

        return Container(
          margin: EdgeInsets.only(bottom: isLast ? 0 : 16),
          decoration: BoxDecoration(
            color: const Color(0xFF0E0E0E),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0x28FF7A00),
              width: 1,
            ),
          ),
          child: _PillarCard(
            step: step,
            onTap: onContactPressed,
            padding: const EdgeInsets.all(24),
          ),
        );
      }).toList(),
    );
  }
}

class _PillarCard extends StatefulWidget {
  final _ServiceStep step;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  const _PillarCard({
    required this.step,
    this.onTap,
    required this.padding,
  });

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          color: _isHovered ? const Color(0xFF161616) : Colors.transparent,
          padding: widget.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Número grande em laranja vibrante com estilo futurista
                  Text(
                    widget.step.number,
                    style: GoogleFonts.syne(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFFF7A00),
                      letterSpacing: -1.0,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Título em branco/creme com tipografia marcante
                  Text(
                    widget.step.title,
                    style: GoogleFonts.syne(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Descrição limpa
                  Text(
                    widget.step.description,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFA1A1AA),
                      height: 1.5,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Tags de entregáveis
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.step.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _isHovered
                          ? const Color(0x33FF7A00)
                          : const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: _isHovered
                            ? const Color(0xFFFF9E42)
                            : const Color(0xFF8E8E93),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceStep {
  final String number;
  final String title;
  final String description;
  final List<String> tags;

  const _ServiceStep({
    required this.number,
    required this.title,
    required this.description,
    required this.tags,
  });
}
