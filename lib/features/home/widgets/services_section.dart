import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniqswims_lp/habitat_theme.dart';
import 'package:uniqswims_lp/l10n/app_localizations.dart';
import 'package:uniqswims_lp/shared/animations/reveal_on_scroll.dart';

class ServicesSection extends StatelessWidget {
  final Key? sectionKey;

  const ServicesSection({super.key, this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Container(
          key: sectionKey,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: HabitatTheme.background,
            border: Border(
              bottom: BorderSide(color: HabitatTheme.border, width: 1),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 64,
            vertical: isMobile ? 64 : 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header da Seção
              RevealOnScroll(
                child: Row(
                  children: [
                    Container(width: 20, height: 1, color: HabitatTheme.textMuted),
                    const SizedBox(width: 12),
                    Text(
                      l10n.servicesEyebrow,
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

              const SizedBox(height: 20),

              RevealOnScroll(
                delay: const Duration(milliseconds: 150),
                child: Text(
                  l10n.servicesTitle,
                  style: GoogleFonts.syne(
                    fontSize: isMobile ? 32 : 56,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.5,
                    color: HabitatTheme.cream,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              RevealOnScroll(
                delay: const Duration(milliseconds: 250),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 540),
                  child: Text(
                    l10n.servicesSubtitle,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: HabitatTheme.textSecondary,
                      height: 1.6,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 64),

              // Lista Editorial de Serviços (Linhas Divisórias)
              _buildServiceRow(
                isMobile: isMobile,
                number: l10n.service1Number,
                title: l10n.service1Title,
                description: l10n.service1Desc,
                tags: [l10n.service1Tag1, l10n.service1Tag2, l10n.service1Tag3],
              ),
              _buildServiceRow(
                isMobile: isMobile,
                number: l10n.service2Number,
                title: l10n.service2Title,
                description: l10n.service2Desc,
                tags: [l10n.service2Tag1, l10n.service2Tag2, l10n.service2Tag3],
              ),
              _buildServiceRow(
                isMobile: isMobile,
                number: l10n.service3Number,
                title: l10n.service3Title,
                description: l10n.service3Desc,
                tags: [l10n.service3Tag1, l10n.service3Tag2, l10n.service3Tag3],
                isLast: true,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceRow({
    required bool isMobile,
    required String number,
    required String title,
    required String description,
    required List<String> tags,
    bool isLast = false,
  }) {
    return RevealOnScroll(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: const BorderSide(color: HabitatTheme.border, width: 1),
            bottom: isLast
                ? const BorderSide(color: HabitatTheme.border, width: 1)
                : BorderSide.none,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: isMobile ? 32 : 48),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    number,
                    style: GoogleFonts.syne(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: HabitatTheme.accent,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: GoogleFonts.syne(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: HabitatTheme.cream,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: HabitatTheme.textSecondary,
                      height: 1.7,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tags.map((t) => _buildTag(t)).toList(),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      number,
                      style: GoogleFonts.syne(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: HabitatTheme.accent,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      title,
                      style: GoogleFonts.syne(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: HabitatTheme.cream,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    flex: 6,
                    child: Text(
                      description,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: HabitatTheme.textSecondary,
                        height: 1.75,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    flex: 3,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: tags.map((t) => _buildTag(t)).toList(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: HabitatTheme.backgroundAlt,
        border: Border.all(color: HabitatTheme.border, width: 1),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
          color: HabitatTheme.textMuted,
        ),
      ),
    );
  }
}
