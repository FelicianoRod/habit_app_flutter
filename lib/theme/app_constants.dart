import 'package:flutter/material.dart';

/// Centraliza las constantes visuales de la app
class AppConstants {
  // ─── Espaciados ───────────────────────────────────────────────
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;

  // ─── Bordes / Radios ──────────────────────────────────────────
  static const double borderRadiusS = 8.0;
  static const double borderRadiusM = 16.0;
  static const double borderRadiusL = 24.0;
  // static const double borderRadiusS = 6.0;
  // static const double borderRadiusM = 12.0;
  // static const double borderRadiusL = 24.0;

  // ─── Sombras ───────────────────────────────────────────────────
  static const List<BoxShadow> cardShadow = [
    BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
  ];

  // ─── Iconos ────────────────────────────────────────────────────
  static const double iconSizeS = 16.0;
  static const double iconSizeM = 24.0;
  static const double iconSizeL = 32.0;

  // ─── Tipografía ────────────────────────────────────────────────
  static const double fontSizeSmall = 12.0;
  static const double fontSizeRegular = 14.0;
  static const double fontSizeLarge = 18.0;
  static const double fontSizeTitle = 22.0;
}
