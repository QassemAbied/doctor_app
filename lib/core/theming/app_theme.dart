import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorManager.bodyColor,

      colorScheme: ColorScheme.light(
        primary: ColorManager.primaryColor,

        secondary: ColorManager.fillBlue,

        surface: ColorManager.whiteColor,

        error: ColorManager.fillRed,

        onPrimary: ColorManager.whiteColor,

        onSecondary: ColorManager.whiteColor,

        onSurface: ColorManager.textPrimary,
      ),

      // ================= APP BAR =================
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.bodyColor,

        elevation: 0,

        centerTitle: true,

        iconTheme: IconThemeData(color: ColorManager.primaryColor),

        titleTextStyle: AppTextStyle.styleBold18(
          ColorManager.textPrimary,
          context,
        ),
      ),

      // ================= CARD =================
      cardTheme: CardThemeData(
        color: ColorManager.whiteColor,

        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

          side: BorderSide(color: ColorManager.grey40),
        ),
      ),

      // ================= TEXT SELECTION =================
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.primaryColor,

        selectionColor: ColorManager.primary40.withValues(alpha: 0.4),

        selectionHandleColor: ColorManager.primaryColor,
      ),

      // ================= INPUT =================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,

        fillColor: ColorManager.whiteColor,

        hintStyle: TextStyle(color: ColorManager.textHint, fontSize: 14),

        labelStyle: TextStyle(color: ColorManager.textSecondary),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: BorderSide(color: ColorManager.grey40, width: 1.3),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: BorderSide(color: ColorManager.primaryColor, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: BorderSide(color: ColorManager.fillRed),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: BorderSide(color: ColorManager.fillRed),
        ),
      ),

      // ================= ELEVATED BUTTON =================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0),

          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return ColorManager.grey50;
            }

            return ColorManager.primaryColor;
          }),

          foregroundColor: WidgetStatePropertyAll(ColorManager.whiteColor),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),

          textStyle: WidgetStatePropertyAll(
            AppTextStyle.styleBold16(ColorManager.whiteColor, context),
          ),
        ),
      ),

      // ================= OUTLINED BUTTON =================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(color: ColorManager.primaryColor),
          ),

          foregroundColor: WidgetStatePropertyAll(ColorManager.primaryColor),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ),

      // ================= TEXT BUTTON =================
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(ColorManager.primaryColor),

          textStyle: WidgetStatePropertyAll(
            AppTextStyle.styleMedium14(ColorManager.primaryColor, context),
          ),
        ),
      ),

      // ================= DIVIDER =================
      dividerColor: ColorManager.grey40,

      // ================= ICON =================
      iconTheme: IconThemeData(color: ColorManager.grey90),

      // ================= PROGRESS =================
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: ColorManager.primaryColor,
      ),
    );
  }
}
