import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final VoidCallback? onManifestoPressed;
  final VoidCallback? onServicesPressed;
  final VoidCallback? onContactPressed;
  final VoidCallback? onScheduleBudgetPressed;
  final VoidCallback? onJoinTeamPressed;

  const Footer({
    super.key,
    this.onManifestoPressed,
    this.onServicesPressed,
    this.onContactPressed,
    this.onScheduleBudgetPressed,
    this.onJoinTeamPressed,
  });

  Future<void> _openUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black, // Fundo 100% preto
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.08),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 54, horizontal: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;
              final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;

              if (isDesktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Coluna 1: Logo & Copyright
                    Expanded(flex: 3, child: _buildBrandCol()),
                    const SizedBox(width: 24),

                    // Coluna 2: Sobre Nós
                    Expanded(flex: 2, child: _buildAboutCol()),
                    const SizedBox(width: 24),

                    // Coluna 3: Contato & Redes
                    Expanded(flex: 3, child: _buildContactCol()),
                    const SizedBox(width: 24),

                    // Coluna 4: Fale com a gente (Botões)
                    Expanded(flex: 3, child: _buildActionButtonsCol()),
                  ],
                );
              }

              if (isTablet) {
                return Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    SizedBox(width: (constraints.maxWidth - 50) / 2, child: _buildBrandCol()),
                    SizedBox(width: (constraints.maxWidth - 50) / 2, child: _buildAboutCol()),
                    SizedBox(width: (constraints.maxWidth - 50) / 2, child: _buildContactCol()),
                    SizedBox(width: (constraints.maxWidth - 50) / 2, child: _buildActionButtonsCol()),
                  ],
                );
              }

              // Mobile Layout
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBrandCol(),
                  const SizedBox(height: 36),
                  _buildAboutCol(),
                  const SizedBox(height: 36),
                  _buildContactCol(),
                  const SizedBox(height: 36),
                  _buildActionButtonsCol(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // --- COLUNA 1: BRAND / LOGO & COPYRIGHT ---
  Widget _buildBrandCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Habitat Logo (apenas o texto limpo, sem ícones nos lados)
        Text(
          'Habitat',
          style: GoogleFonts.syne(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          '@ Habitat - 2026.\nTodos os direitos reservados',
          style: GoogleFonts.inter(
            fontSize: 13,
            color: Colors.white.withOpacity(0.65),
            height: 1.55,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // --- COLUNA 2: SOBRE NÓS ---
  Widget _buildAboutCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Sobre Nós',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 18),
        _FooterTextLink(
          label: 'Manifesto',
          onTap: onManifestoPressed,
        ),
        const SizedBox(height: 12),
        _FooterTextLink(
          label: 'Serviços',
          onTap: onServicesPressed,
        ),
        const SizedBox(height: 12),
        _FooterTextLink(
          label: 'Contato',
          onTap: onContactPressed,
        ),
      ],
    );
  }

  // --- COLUNA 3: CONTATO & REDES ---
  Widget _buildContactCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Contato',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 18),
        InkWell(
          onTap: () => _openUrl('mailto:contato@habitatmedia.com.br'),
          mouseCursor: SystemMouseCursors.click,
          child: Text(
            'contato@habitatmedia.com.br',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'everywhere around Brazil',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 18),
        // Social Media Icons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SocialIconButton(
              icon: FontAwesomeIcons.linkedinIn,
              tooltip: 'LinkedIn',
              onTap: () => _openUrl('https://linkedin.com/company/habitatmedia'),
            ),
            const SizedBox(width: 8),
            _SocialIconButton(
              icon: FontAwesomeIcons.instagram,
              tooltip: 'Instagram',
              onTap: () => _openUrl('https://instagram.com/habitatmedia'),
            ),
            const SizedBox(width: 8),
            _SocialIconButton(
              icon: FontAwesomeIcons.youtube,
              tooltip: 'YouTube',
              onTap: () => _openUrl('https://youtube.com/@habitatmedia'),
            ),
            const SizedBox(width: 8),
            _SocialIconButton(
              icon: FontAwesomeIcons.facebookF,
              tooltip: 'Facebook',
              onTap: () => _openUrl('https://facebook.com/habitatmedia'),
            ),
            const SizedBox(width: 8),
            _SocialIconButton(
              icon: FontAwesomeIcons.twitter,
              tooltip: 'X / Twitter',
              onTap: () => _openUrl('https://twitter.com/habitatmedia'),
            ),
          ],
        ),
      ],
    );
  }

  // --- COLUNA 4: FALE COM A GENTE (BOTÕES PILL) ---
  Widget _buildActionButtonsCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Fale com a gente',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 18),
        _PillButton(
          label: 'Agendar um orçamento',
          onTap: onScheduleBudgetPressed ?? onContactPressed,
        ),
        const SizedBox(height: 12),
        _PillButton(
          label: 'Faça parte do time',
          onTap: onJoinTeamPressed ?? () => _openUrl('mailto:contato@habitatmedia.com.br?subject=Faca%20parte%20do%20time'),
        ),
      ],
    );
  }
}

// Widget auxiliar: Link de texto com hover suave
class _FooterTextLink extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;

  const _FooterTextLink({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  State<_FooterTextLink> createState() => _FooterTextLinkState();
}

class _FooterTextLinkState extends State<_FooterTextLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _isHovered ? const Color(0xFF4DB8FF) : Colors.white.withOpacity(0.9),
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}

// Widget auxiliar: Ícone social em container arredondado
class _SocialIconButton extends StatefulWidget {
  final dynamic icon;
  final String tooltip;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: _isHovered ? const Color(0xFF262626) : const Color(0xFF141414),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _isHovered ? const Color(0xFF4DB8FF).withOpacity(0.6) : Colors.white.withOpacity(0.12),
                width: 1,
              ),
            ),
            child: Center(
              child: FaIcon(
                widget.icon,
                size: 14,
                color: _isHovered ? const Color(0xFF4DB8FF) : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget auxiliar: Botão arredondado estilo Pill
class _PillButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;

  const _PillButton({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  State<_PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<_PillButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFF222222) : const Color(0xFF141414),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: _isHovered ? const Color(0xFF4DB8FF).withOpacity(0.6) : Colors.white.withOpacity(0.18),
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF4DB8FF).withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              widget.label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
