import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kayou_cards/app/shared/themes/app_colors.dart';

class AppTextStyles {
  static TextStyle latoLight({
    Color? color,
    double? size,
  }) =>
      GoogleFonts.lato(
        color: color ?? AppColors.black,
        fontSize: size ?? 16,
        fontWeight: FontWeight.w300,
      );

  static TextStyle latoRegular({
    Color? color,
    double? size,
  }) =>
      GoogleFonts.lato(
        color: color ?? AppColors.black,
        fontSize: size ?? 16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle latoMedium({
    Color? color,
    double? size,
  }) =>
      GoogleFonts.lato(
        color: color ?? AppColors.black,
        fontSize: size ?? 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle latoSemiBold({
    Color? color,
    double? size,
  }) =>
      GoogleFonts.lato(
        color: color ?? AppColors.black,
        fontSize: size ?? 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle latoBold({
    Color? color,
    double? size,
  }) =>
      GoogleFonts.lato(
        color: color ?? AppColors.primary,
        fontSize: size ?? 18,
        fontWeight: FontWeight.w700,
      );
}
