import 'package:flutter/material.dart';

class AppStyles {
  // ==========================================================
  // CORES DO AMIGOPET
  // ==========================================================

  static const Color verdeEscuro =
  Color(0xFF24513A);

  static const Color verdeClaro =
  Color(0xFFE4F0E7);

  static const Color creme =
  Color(0xFFF8F6F0);

  static const Color texto =
  Color(0xFF26332B);

  static const Color textoSecundario =
  Color(0xFF7A837D);

  static const Color branco =
      Colors.white;

  // ==========================================================
  // TÍTULOS
  // ==========================================================

  static const TextStyle titulo =
  TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: texto,
  );

  static const TextStyle subtitulo =
  TextStyle(
    fontSize: 10,
    color: textoSecundario,
    height: 1.4,
  );

  // ==========================================================
  // SOMBRA DOS CARDS
  // ==========================================================

  static const List<BoxShadow> sombraCard = [
    BoxShadow(
      color: Color(0x12000000),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ];
}