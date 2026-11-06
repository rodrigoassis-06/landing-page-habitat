import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniqswims_lp/habitat_theme.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/shared/animations/reveal_on_scroll.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onPortfolioPressed;
  final Key? sectionKey;

  const HeroSection({
    super.key,
    required this.onContactPressed,
    required this.onPortfolioPressed,
    this.sectionKey,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
        final screenHeight = MediaQuery.sizeOf(context).height;

        return Container(
          key: sectionKey,
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: isMobile ? 650 : (screenHeight - 80).clamp(650.0, 950.0),
          ),
          decoration: const BoxDecoration(
            color: HabitatTheme.background,
            border: Border(
              bottom: BorderSide(color: HabitatTheme.border, width: 1),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 64,
            vertical: isMobile ? 48 : 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top tag & year
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RevealOnScroll(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: HabitatTheme.accent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          l10n.heroEyebrow,
                          style: GoogleFonts.syne(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.5,
                            color: HabitatTheme.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isMobile)
                    RevealOnScroll(
                      child: Text(
                        '© 2026',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          letterSpacing: 2.0,
                          color: HabitatTheme.textMuted,
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 60),

              // Title Grande Editorial
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RevealOnScroll(
                    child: Text(
                      l10n.heroTitleLine1,
                      style: GoogleFonts.syne(
                        fontSize: isMobile ? 42 : 84,
                        fontWeight: FontWeight.w800,
                        color: HabitatTheme.cream,
                        letterSpacing: isMobile ? -1.0 : -3.0,
                        height: 0.95,
                      ),
                    ),
                  ),
                  RevealOnScroll(
                    delay: const Duration(milliseconds: 150),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'HABITAT ',
                            style: GoogleFonts.syne(
                              fontSize: isMobile ? 42 : 84,
                              fontWeight: FontWeight.w800,
                              color: HabitatTheme.cream,
                              letterSpacing: isMobile ? -1.0 : -3.0,
                              height: 0.95,
                            ),
                          ),
                          TextSpan(
                            text: 'PERFEITO',
                            style: GoogleFonts.syne(
                              fontSize: isMobile ? 42 : 84,
                              fontWeight: FontWeight.w800,
                              color: HabitatTheme.accent,
                              letterSpacing: isMobile ? -1.0 : -3.0,
                              height: 0.95,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RevealOnScroll(
                    delay: const Duration(milliseconds: 300),
                    child: Text(
                      l10n.heroTitleLine3,
                      style: GoogleFonts.syne(
                        fontSize: isMobile ? 42 : 84,
                        fontWeight: FontWeight.w800,
                        color: HabitatTheme.cream,
                        letterSpacing: isMobile ? -1.0 : -3.0,
                        height: 0.95,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Rodapé do Hero: Descrição + Botões
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RevealOnScroll(
                          delay: const Duration(milliseconds: 400),
                          child: Text(
                            l10n.heroSubtitle,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: HabitatTheme.textSecondary,
                              height: 1.7,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: onContactPressed,
                                child: Text(l10n.heroCtaPrimary),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: onPortfolioPressed,
                                child: Text(l10n.heroCtaSecondary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 6,
                          child: RevealOnScroll(
                            delay: const Duration(milliseconds: 400),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 580),
                              child: Text(
                                l10n.heroSubtitle,
                                style: GoogleFonts.inter(
                                  fontSize: 17,
                                  color: HabitatTheme.textSecondary,
                                  height: 1.75,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        RevealOnScroll(
                          delay: const Duration(milliseconds: 500),
                          child: Row(
                            children: [
                              OutlinedButton(
                                onPressed: onPortfolioPressed,
                                child: Text(l10n.heroCtaSecondary),
                              ),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: onContactPressed,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(l10n.heroCtaPrimary),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.arrow_forward, size: 14),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
