import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle fonte = GoogleFonts.ramabhadra(
    color: AppColors.white,
    fontSize: 37,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle title = GoogleFonts.ramabhadra(
    color: AppColors.white,
    fontSize: 55,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle button = GoogleFonts.ramabhadra(
    color: AppColors.blue,
    fontSize: 20,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle body = GoogleFonts.ramabhadra(
    color: AppColors.white,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );
}