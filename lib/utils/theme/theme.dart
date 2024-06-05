import 'package:flutter/material.dart';
import 'package:ottui/utils/constants/colors.dart';
import 'package:ottui/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ottui/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ottui/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ottui/utils/theme/custom_themes/chip_theme.dart';
import 'package:ottui/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ottui/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:ottui/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ottui/utils/theme/custom_themes/text_theme.dart';

class OttAppTheme {

  OttAppTheme._();

  //light theme
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      textTheme: AppTextTheme.lightTextTheme,
      chipTheme: AppChipTheme.lightChipTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: OttAppBarTheme.lightAppBarTheme,
      checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: BottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedBtnTheme,
      outlinedButtonTheme: AppOutlineButtonTheme.lightOutlinedBtnTheme,
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme
  );

  //dark theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      textTheme: AppTextTheme.darkTextTheme,
      chipTheme: AppChipTheme.darkChipTheme,
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: OttAppBarTheme.darkAppBarTheme,
      checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: BottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedBtnTheme,
      outlinedButtonTheme: AppOutlineButtonTheme.darkOutlinedBtnTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme
  );
}
