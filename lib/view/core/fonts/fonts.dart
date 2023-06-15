import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/colors.dart';

class GoogleFont {
  static final TextStyle splashStyle = GoogleFonts.oswald(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
    color: kBlack,
    // decoration: TextDecoration.underline,
  );
  static final TextStyle appBarStyle = GoogleFonts.poppins(
    fontSize: 24, fontWeight: FontWeight.w600, color: kWhite,
    // decoration: TextDecoration.underline,
  );
  static final TextStyle textFieldStyle = GoogleFonts.poppins(
    fontSize: 16, fontWeight: FontWeight.w500, color: kBlack,
    // decoration: TextDecoration.underline,
  );
  static final TextStyle homeHeadStyle = GoogleFonts.poppins(
    fontSize: 20, fontWeight: FontWeight.w500, color: kBlack,

    // decoration: TextDecoration.underline,
  );
  static final TextStyle toggleTextStyle = GoogleFonts.poppins(
    fontSize: 12, fontWeight: FontWeight.w500, color: kBlack,

    // decoration: TextDecoration.underline,
  );
}
