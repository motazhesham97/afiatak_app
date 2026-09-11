import 'package:flutter/material.dart';

/// Box shadows from the Aafiatak design system (Burgundy Monochrome v2.1).
abstract final class AppShadows {
  AppShadows._();

  /// No shadow — flat surface.
  static const List<BoxShadow> none = [];

  /// e1 — resting cards, inputs, icon buttons, list rows.
  /// CSS: 0 2px 10px rgba(26,26,26,.055)
  static const List<BoxShadow> e1 = [
    BoxShadow(
      color: Color(0x0E1A1A1A),
      offset: Offset(0, 2),
      blurRadius: 10,
    ),
  ];

  /// e2 — floating/overlay surfaces (bottom actions, popups).
  /// CSS: 0 14px 34px rgba(26,26,26,.11)
  static const List<BoxShadow> e2 = [
    BoxShadow(
      color: Color(0x1C1A1A1A),
      offset: Offset(0, 14),
      blurRadius: 34,
    ),
  ];

  /// brand — burgundy glow under primary buttons and feature panels.
  /// CSS: 0 12px 26px rgba(128,0,32,.20)
  static const List<BoxShadow> brand = [
    BoxShadow(
      color: Color(0x33800020),
      offset: Offset(0, 12),
      blurRadius: 26,
    ),
  ];
}