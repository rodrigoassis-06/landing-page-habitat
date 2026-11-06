import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniqswims_lp/habitat_theme.dart';

class HabitatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  final Map<String, GlobalKey?> navMap;
  final Function(GlobalKey?) onNavigate;
  final VoidCallback onCtaPressed;

  const HabitatAppBar({
    super.key,
    required this.scrollController,
    required this.navMap,
    required this.onNavigate,
    required this.onCtaPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 850;

        return Container(
          height: 72,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 64),
          decoration: const BoxDecoration(
            color: Color(0xE60D0D0D), // 90% opacity preto grafite
            border: Border(
              bottom: BorderSide(color: HabitatTheme.border, width: 1),
            ),
          ),
          child: Row(
            children: [
              // Logo Habitat
              InkWell(
                onTap: () => onNavigate(null),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HABITAT',
                      style: GoogleFonts.syne(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 5.0,
                        color: HabitatTheme.cream,
                      ),
                    ),
                    Text(
                      'MEDIA · 360°',
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2.5,
                        color: HabitatTheme.textMuted,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Desktop Nav Links
              if (!isMobile) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: navMap.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextButton(
                        onPressed: () => onNavigate(entry.value),
                        style: TextButton.styleFrom(
                          foregroundColor: HabitatTheme.textSecondary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          entry.key.toUpperCase(),
                          style: GoogleFonts.syne(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: onCtaPressed,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                  child: const Text('CONTATO'),
                ),
              ] else ...[
                // Mobile Hamburguer Menu
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, color: HabitatTheme.cream),
                  color: HabitatTheme.backgroundAlt,
                  elevation: 8,
                  onSelected: (label) => onNavigate(navMap[label]),
                  itemBuilder: (ctx) => navMap.keys.map((label) {
                    return PopupMenuItem<String>(
                      value: label,
                      child: Text(
                        label,
                        style: GoogleFonts.syne(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: HabitatTheme.cream,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
