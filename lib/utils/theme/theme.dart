import 'package:flutter/material.dart';
import 'package:dalkor/utils/theme/custom_theme/appbar_theme.dart';
import 'package:dalkor/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:dalkor/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:dalkor/utils/theme/custom_theme/chip_theme.dart';
import 'package:dalkor/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:dalkor/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:dalkor/utils/theme/custom_theme/text_field_theme.dart';
import 'package:dalkor/utils/theme/custom_theme/text_theme.dart';

/// Custom App Theme in both Light & Dark Themes
class AppTheme {
  AppTheme._(); // To avoid creating instances of this class...

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: KAppBarTheme.lightAppBarTheme,
    textTheme: KTextTheme.lightTextTheme,
    inputDecorationTheme: KTextFormField.lightInputDecorationTheme,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.lightOutlinedButtonTheme,
    bottomSheetTheme: KBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: KCheckboxTheme.lightCheckboxTheme,
    chipTheme: KChipTheme.lightChipTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    textTheme: KTextTheme.darkTextTheme,
    inputDecorationTheme: KTextFormField.darkInputDecorationTheme,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.darkOutlinedButtonTheme,
    bottomSheetTheme: KBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: KCheckboxTheme.darkCheckboxTheme,
    chipTheme: KChipTheme.darkChipTheme,
  );
}
