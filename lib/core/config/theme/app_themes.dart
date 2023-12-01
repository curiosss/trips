import 'package:flutter/material.dart';
import 'package:trips/core/config/styles/dimens.dart';
import 'package:trips/core/config/theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  primaryColor: AppColors.primaryGreen,
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
