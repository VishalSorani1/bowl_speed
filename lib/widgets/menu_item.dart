  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PopupMenuItem buildMenuItem(String text) {
    return PopupMenuItem(
      onTap: () {},
      padding: const EdgeInsets.only(left: 24.0),
      textStyle: GoogleFonts.rubik(),
      child: Text(text),
    );
  }