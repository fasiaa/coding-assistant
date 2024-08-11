import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Light Theme Text
  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xff000000), // Black text for light theme
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xff000000),
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xff000000),
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[700],
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey[700],
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF6B6A6A),
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );

  // Dark Theme Text
  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xffA9B1D6), // White text for dark theme
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xffA9B1D6),
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xffA9B1D6),
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xffA9B1D6),
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xffA9B1D6),
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xFFB3B3B3),
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xffA9B1D6),
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xffA9B1D6),
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: const Color(0xffA9B1D6),
    ),
  );
}
