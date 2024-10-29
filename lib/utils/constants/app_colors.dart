import 'package:flutter/material.dart';

/// Custom colors used in the application
class AppColors {
  AppColors._(); // Prevents instantiation

  // Basic Colors
  static const Color primary = Color(0xFF105CFF);
  static const Color secondary = Color(0xFFAE803C);
  static const Color accent = Color(0xFFd8fcf8);

  // Gold Colors
  static const Color gold = Color(0xFFE5B80B);
  static const Color goldAccent = Color(0xFFf9d71c);

  // Gradient Colors
  static const Gradient linierGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFFff9a9e),
      Color(0xFFfad0c4),
      Color(0xFFfad0c4),
    ],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c757d);
  static const Color textWhite = Color(0xFFffffff);

  // Background Colors
  static const Color light = Color(0xFFF7FFFA);
  static const Color dark = Color(0xFF012C14);
  static const Color primaryBackground = Color(0xFFf3f5ff);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFf6f6f6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF06594E);
  static const Color buttonSecondary = Color(0xFF6c757d);
  static const Color buttonDisabled = Color(0xFFc4c4c4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFd9d9d9);
  static const Color borderSecondary = Color(0xFFe6e6e6);

  // Error & Success Colors
  static const Color error = Color(0xFFd32f2f);
  static const Color danger = Color(0xFFC50000);
  static const Color success = Color(0xFF08A045);
  static const Color warning = Color(0xFFf57c00);
  static const Color info = Color(0xFF1976d2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4f4f4f);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFe0e0e0);
  static const Color softGrey = Color(0xFFf4f4f4);
  static const Color lightGrey = Color(0xFFf9f9f9);
  static const Color white = Color(0xFFffffff);
}
