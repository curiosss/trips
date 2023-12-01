import 'package:flutter/material.dart';
import 'package:trips/config/styles/dimens.dart';
import 'package:trips/config/theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  primaryColor: AppColors.primaryGreen,
  scaffoldBackgroundColor: Color.fromARGB(255, 231, 227, 227),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryGreen,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.midBorder),
      ),
    ),
  ),
);
