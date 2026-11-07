import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniqswims_lp/shared/animations/hover_scale.dart';
import 'package:uniqswims_lp/shared/animations/reveal_on_scroll.dart';

class ClosingCtaSection extends StatelessWidget {
  final Key? sectionKey;
  final VoidCallback? onContactPressed;

  const ClosingCtaSection({
    super.key,
    this.sectionKey,
    this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Container(
          key: sectionKey,
          width: double.infinity,
          color: Colors.white, // Fundo Branco
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 56 : 100,
            horizontal: isMobile ? 24 : 48,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: RevealOnScroll(
                child: isMobile
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Lado Esquerdo: Título
        Expanded(
          flex: 6,
          child: Text(
            'O próximo grande salto da sua marca começa no lugar certo.',
            style: GoogleFonts.montserrat(
              fontSize: 38,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF111827),
              height: 1.2,
              letterSpacing: -0.5,
            ),
          ),
        ),
        const SizedBox(width: 64),
        // Lado Direito: Texto Descritivo + Botão
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Não entregamos soluções genéricas nem descartáveis. Construímos o ecossistema ideal para a sua empresa operar com eficiência máxima, encantar clientes e dominar o seu mercado.',
                style: GoogleFonts.inter(
                  fontSize: 17,
                  color: const Color(0xFF374151),
                  height: 1.65,
                ),
              ),
              const SizedBox(height: 32),
              _buildButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'O próximo grande salto da sua marca começa no lugar certo.',
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF111827),
            height: 1.25,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Não entregamos soluções genéricas nem descartáveis. Construímos o ecossistema ideal para a sua empresa operar com eficiência máxima, encantar clientes e dominar o seu mercado.',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: const Color(0xFF374151),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),
        _buildButton(context),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return HoverScale(
      scale: 1.02,
      child: OutlinedButton.icon(
        onPressed: onContactPressed,
        icon: const Icon(Icons.arrow_forward, size: 18),
        label: Text(
          'Iniciar meu projeto',
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF111827),
          side: const BorderSide(color: Color(0xFF111827), width: 1.5),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
