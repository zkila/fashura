import 'package:flutter/material.dart';

class TColors {
  TColors._();

  static const Color brown1 = Color(0xFFf7e7d3); // Lightest brown
  static const Color brown2 = Color(0xFFe8c7a1);
  static const Color brown3 = Color(0xFFd9a86f);
  static const Color brown4 = Color(0xFFca8940);
  static const Color brown5 = Color(0xFFb96f2d);
  static const Color brown6 = Color(0xFFa65a1d);
  static const Color brown7 = Color(0xFF8a4816);
  static const Color brown8 = Color(0xFF6e370f);
  static const Color brown9 = Color.fromARGB(255, 53, 40, 30); // Darkest brown

  // Blue Colors
  static const Color blue1 = Color(0xFFe5f1ff);
  static const Color blue2 = Color(0xFFb3d6ff);
  static const Color blue3 = Color(0xFF80bbff);
  static const Color blue4 = Color(0xFF4d9fff);
  static const Color blue5 = Color(0xFF1a84ff);
  static const Color blue6 = Color(0xFF006ae6);
  static const Color blue7 = Color(0xFF0053b3);
  static const Color blue8 = Color(0xFF003b80);
  static const Color blue9 = Color(0xFF00234d);

  // Orange Colors
  static const Color orange1 = Color(0xFFfdece7);
  static const Color orange2 = Color(0xFFf9c5b8);
  static const Color orange3 = Color(0xFFf69e89);
  static const Color orange4 = Color(0xFFf2785a);
  static const Color orange5 = Color(0xFFee512a);
  static const Color orange6 = Color(0xFFd53811);
  static const Color orange7 = Color(0xFFa52b0d);
  static const Color orange8 = Color(0xFF761f09);
  static const Color orange9 = Color(0xFF471306);

  // App theme colors
  static const Color primary = brown6;
  static const Color secondary = Color(0xFFd53811);
  static const Color accent = Color(0xFFb3d6ff);

  // Gradient colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [Color(0xffff9a9e), Color(0xfffad0c4), Color(0xfffad0c4)]);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = TColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimary = Color(0xFF006ae6);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFFFCC00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
