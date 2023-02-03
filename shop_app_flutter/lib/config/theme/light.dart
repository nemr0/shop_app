import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Radius radius = Radius.circular(30);
InputBorder border(Color color, bool isMiddle) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 30),
      borderRadius: isMiddle
          ? BorderRadius.zero
          : const BorderRadius.only(
              topRight: radius,
              topLeft: radius,
            ),
    );
ThemeData lightTheme() => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.tajawal().fontFamily,
    textTheme: const TextTheme(
        labelLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        labelSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)));
