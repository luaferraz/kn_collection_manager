import 'package:flutter/material.dart';
import 'package:kayou_cards/app/shared/themes/app_colors.dart';

class ThemeProvider extends ChangeNotifier {}

class AppThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bg,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(elevation: 0),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          AppColors.primary,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
        side: MaterialStateProperty.all(
          BorderSide(
            color: AppColors.primary,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
        ),
      ),
    ),
  );
}
