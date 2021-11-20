import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextStyle logoText = GoogleFonts.lato(
    textStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 40,
    ),
  );
  static TextStyle buttonText = GoogleFonts.lato(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
  );

  static TextStyle appBarTitleText = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
  );

  static TextStyle cardTitleText = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
  );
  static TextStyle activeTabText = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
  );
  static TextStyle inactiveTabText = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.grey.shade700,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    ),
  );

  static InputDecoration textFieldDecoration = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
      borderRadius: BorderRadius.circular(10.0),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
      borderRadius: BorderRadius.circular(10.0),
    ),
    labelStyle: TextStyle(color: Colors.pink),
    prefixIcon: Icon(Icons.lock_outline, color: Colors.pink),
  );
}
