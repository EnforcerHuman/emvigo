import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_task/core/constants/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get headingRegular => GoogleFonts.dmSerifDisplay(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static TextStyle get headingRegularBlack => GoogleFonts.dmSerifDisplay(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: Colors.black,
  );

  static TextStyle get headingBold => GoogleFonts.dmSerifDisplay(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.primaryColor,
  );

  static TextStyle get headingLink => GoogleFonts.dmSerifDisplay(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: Color(0xFF767676),
  );

  static TextStyle get bodyRegular => GoogleFonts.outfit(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static TextStyle get bodyBlack => GoogleFonts.outfit(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: Colors.black,
  );

  static TextStyle get bodyText => GoogleFonts.outfit(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.textColor,
  );

  static TextStyle get bodyGray => GoogleFonts.outfit(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.textGray,
  );

  static TextStyle get subtitle => GoogleFonts.outfit(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textColor,
  );
}
