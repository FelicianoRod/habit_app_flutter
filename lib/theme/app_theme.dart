import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Paleta de colores base
  static const Color _lightPrimary = Color(0xFF6FA4AF);
  static const Color _darkPrimary = Color(0xFF388E3C);

  // Tema claro
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: _lightPrimary,
      secondary: Color(0xFFB8C4A9),
      tertiary: const Color(0xFFF4E9D7),
      background: Color(0xFFF5F5F5),
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: Colors.black,
      onSurface: Colors.black,
      surfaceContainer: _lightPrimary.withValues(alpha: 0.10),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      // backgroundColor: const Color(0xFF6FA4AF),
      // foregroundColor: Colors.white,
      backgroundColor: Colors.white,
      foregroundColor: _lightPrimary,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF6FA4AF),
      foregroundColor: Colors.white,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFFF4E9D7),
      labelStyle: const TextStyle(color: Colors.black87),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF6FA4AF),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
      bodyMedium: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
      bodySmall: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
    ),
  );

  // Tema oscuro
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: _darkPrimary,
      secondary: Color(0xFF66BB6A),
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
  );
}
// background Color(0xFF0E0E10)

// habit card Color(0xFF1A1A1C)
