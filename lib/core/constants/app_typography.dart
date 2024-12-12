import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_colors.dart";
import "package:google_fonts/google_fonts.dart";

class AppTypography {
  static TextStyle typo30PrimaryBold = GoogleFonts.openSans(
    fontSize: 30,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle typo30DarkBold = GoogleFonts.openSans(
    fontSize: 30,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.darkColor,
  );

  static TextStyle typo30WhiteBold = GoogleFonts.openSans(
    fontSize: 30,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle typo26WhiteBold = GoogleFonts.openSans(
    fontSize: 26,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle typo26DarkBold = GoogleFonts.openSans(
    fontSize: 26,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.darkColor,
  );

  static TextStyle typo16WhiteRegular = GoogleFonts.openSans(
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle typo12TextBold = GoogleFonts.openSans(
    fontSize: 12,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle typo16TextRegular = GoogleFonts.openSans(
    color: AppColors.textColor,
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.normal,
  );

  static TextStyle typo12ErrorRegular = GoogleFonts.openSans(
    fontSize: 12,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
  );

  static TextStyle typo16SecondarySemibold = GoogleFonts.openSans(
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );

  static TextStyle typo12PrimarySemibold = GoogleFonts.openSans(
    fontSize: 12,
    height: 1.2,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static TextStyle typo16PrimarySemibold = GoogleFonts.openSans(
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static TextStyle typo14SecondaryBold = GoogleFonts.openSans(
    fontSize: 14,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryColor,
  );

  static TextStyle typo14WhiteBold = GoogleFonts.openSans(
    fontSize: 14,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

   static const TextStyle typo40BlackNormal = TextStyle(
    fontSize: 40,
  );
  static const TextStyle typo16MediumkBold =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 16);

}
