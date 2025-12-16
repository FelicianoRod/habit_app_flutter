import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  // Si viene sin el prefijo #
  hex = hex.replaceAll('#', '');
  // Añadimos FF si no incluye canal alfa
  if (hex.length == 6) hex = 'FF$hex';
  return Color(int.parse(hex, radix: 16));
}
