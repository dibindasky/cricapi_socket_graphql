import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme Configuration
  static ThemeData lightTheme() {
    return ThemeData(
      // fontFamily: fontPoppins,
      scaffoldBackgroundColor: koffwhite,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: kprimary,
        onPrimary: kblack,
        error: kred,
        onTertiary: kwhite,
        secondary: kgrey,
      ),
      dividerTheme: DividerThemeData(color: kgrey.withOpacity(0.4)),

      cardColor: kwhite,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: kblack,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: kwhite,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: kblack,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(color: kwhite, fontSize: 12),
        displaySmall: TextStyle(color: kblack, fontSize: 12),
        displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          color: kblack,
          fontSize: 14,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: kblack,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          color: kblack,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(fontSize: 13, color: kblack),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: kblack,
        refreshBackgroundColor: kblack,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: koffwhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kgrey, width: 1.0),
        ),
      ),
      cardTheme: const CardThemeData(
        color: kwhite,
        shadowColor: kgrey,
        elevation: 0,
      ),
      navigationBarTheme: const NavigationBarThemeData(backgroundColor: kwhite),
      appBarTheme: const AppBarTheme(
        backgroundColor: koffwhite,
        foregroundColor: kblack,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 17,
          color: kblack,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kprimary,
          foregroundColor: kwhite,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(color: kwhite),
      switchTheme: SwitchThemeData(
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kprimary; // Thumb color when switch is ON
          }
          return kgrey; // Thumb color when switch is OFF
        }),
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kprimary; // Thumb color when switch is ON
          }
          return kgrey; // Thumb color when switch is OFF
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kprimary.withOpacity(0.5); // Track color when switch is ON
          }
          return kwhite; // Track color when switch is OFF
        }),
        trackOutlineWidth: WidgetStateProperty.all(1),
        materialTapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // Reduces tap target size
      ),
    );
  }

  // Dark Theme Configuration
  static ThemeData darkTheme() {
    return ThemeData(
      // fontFamily: fontPoppins,
      scaffoldBackgroundColor: koffBlack,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: kprimary,
        onPrimary: kwhite,
        error: kred,
        onTertiary: kblack,
        secondary: kgrey,
      ),
      dividerTheme: DividerThemeData(color: kgrey.withOpacity(0.4)),

      cardColor: kblack,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: kwhite,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: kblack,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: kwhite,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(color: kblack, fontSize: 12),
        displaySmall: TextStyle(color: kwhite, fontSize: 12),
        displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          color: kwhite,
          fontSize: 14,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: kwhite,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          color: kwhite,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(fontSize: 13, color: kwhite),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: kwhite,
        refreshBackgroundColor: kwhite,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: koffBlack,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kgrey, width: 1.0),
        ),
      ),
      cardTheme: const CardThemeData(
        color: kblack,
        shadowColor: kgrey,
        elevation: 0,
      ),
      navigationBarTheme: const NavigationBarThemeData(backgroundColor: kblack),
      appBarTheme: const AppBarTheme(
        backgroundColor: koffBlack,
        foregroundColor: kwhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 17,
          color: kwhite,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kprimary,
          foregroundColor: kblack,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(color: kblack),
      switchTheme: SwitchThemeData(
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kprimary; // Thumb color when switch is ON
          }
          return kgrey; // Thumb color when switch is OFF
        }),
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kprimary; // Thumb color when switch is ON
          }
          return kgrey; // Thumb color when switch is OFF
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kprimary.withOpacity(0.5); // Track color when switch is ON
          }
          return kblack; // Track color when switch is OFF
        }),
        trackOutlineWidth: WidgetStateProperty.all(1),
        materialTapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // Reduces tap target size
      ),
    );
  }
}
