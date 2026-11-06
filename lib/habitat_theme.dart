import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitatTheme {
  // Paleta Editorial Graphite & Cream
  static const Color background = Color(0xFF0D0D0D);
  static const Color backgroundAlt = Color(0xFF141414);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color border = Color(0x1FFFFFFF);
  static const Color borderHover = Color(0x3FFFFFFF);

  static const Color cream = Color(0xFFF0EDE8);
  static const Color textSecondary = Color(0x99F0EDE8);
  static const Color textMuted = Color(0x66F0EDE8);

  static const Color accent = Color(0xFF4DB8FF);
  static const Color accentHover = Color(0xFF75C7FF);

  static TextStyle get syne => GoogleFonts.syne();
  static TextStyle get inter => GoogleFonts.inter();

  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: accent,

      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        primary: accent,
        secondary: cream,
        surface: surface,
        onSurface: cream,
        onPrimary: background,
      ),

      // Tipografia Editorial
      textTheme: TextTheme(
        displayLarge: GoogleFonts.syne(
          fontSize: 64,
          fontWeight: FontWeight.w800,
          color: cream,
          letterSpacing: -2.0,
          height: 1.05,
        ),
        displayMedium: GoogleFonts.syne(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          color: cream,
          letterSpacing: -1.5,
          height: 1.1,
        ),
        headlineLarge: GoogleFonts.syne(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: cream,
          letterSpacing: -1.0,
        ),
        headlineMedium: GoogleFonts.syne(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: cream,
          letterSpacing: -0.5,
        ),
        titleLarge: GoogleFonts.syne(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: cream,
          letterSpacing: 2.0,
        ),
        titleMedium: GoogleFonts.syne(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: cream,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          color: textSecondary,
          height: 1.7,
          fontWeight: FontWeight.w300,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 15,
          color: textSecondary,
          height: 1.6,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: GoogleFonts.syne(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
          color: cream,
        ),
      ),

      iconTheme: const IconThemeData(color: cream),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: cream),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered)) return accent;
            return cream;
          }),
          foregroundColor: WidgetStateProperty.all<Color>(background),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          ),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.syne(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              letterSpacing: 1.5,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.hovered)) return cream;
            return textSecondary;
          }),
          side: WidgetStateProperty.resolveWith<BorderSide>((states) {
            if (states.contains(WidgetState.hovered)) {
              return const BorderSide(color: cream, width: 1.0);
            }
            return const BorderSide(color: border, width: 1.0);
          }),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          ),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.syne(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 1.5,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          ),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: border,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
