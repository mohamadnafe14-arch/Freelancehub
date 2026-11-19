import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static final ThemeData light = _createTheme(Brightness.light);
  static final ThemeData dark = _createTheme(Brightness.dark);

  static const ThemeMode defaultThemeMode = ThemeMode.system;

  static const String _displayFontFamily = 'Wix Madefor Display';
  static const String _bodyFontFamily = 'Instrument Sans';
  static const TextStyle monoTextStyle = TextStyle(
    fontFamily: 'Source Code Pro',
    fontSize: 13,
    height: 18 / 13,
    fontWeight: FontWeight.w500,
  );

  static ThemeData _createTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final background = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;
    final surface = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final onSurface = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final secondaryText = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final border = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final surfaceSubtle = isDark
        ? AppColors.darkSurfaceSubtle
        : AppColors.lightSurfaceSubtle;
    final onPrimary = isDark ? AppColors.darkBackground : Colors.white;
    final primaryContainer = isDark
        ? AppColors.darkPrimaryContainer
        : AppColors.lightPrimaryContainer;
    final onPrimaryContainer = isDark
        ? AppColors.darkOnPrimaryContainer
        : AppColors.lightOnPrimaryContainer;
    final errorContainer = isDark
        ? AppColors.darkErrorContainer
        : AppColors.lightErrorContainer;
    final onErrorContainer = isDark
        ? AppColors.darkOnErrorContainer
        : AppColors.lightOnErrorContainer;

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: primary,
          brightness: brightness,
          surface: surface,
        ).copyWith(
          primary: primary,
          onPrimary: onPrimary,
          secondary: primary,
          onSecondary: onPrimary,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: surface,
          onSurface: onSurface,
          onSurfaceVariant: secondaryText,
          surfaceContainerHighest: surfaceSubtle,
          primaryContainer: primaryContainer,
          onPrimaryContainer: onPrimaryContainer,
          errorContainer: errorContainer,
          onErrorContainer: onErrorContainer,
          outline: border,
          outlineVariant: border,
        );
    final textTheme = _createTextTheme(onSurface, secondaryText);
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: border),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      canvasColor: surface,
      dividerColor: border,
      fontFamily: _bodyFontFamily,
      textTheme: textTheme,
      appBarTheme: AppBarThemeData(
        backgroundColor: surface,
        foregroundColor: onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: surface,
        surfaceTintColor: Colors.transparent,
        shadowColor: isDark ? Colors.transparent : const Color(0x0A0F172A),
        elevation: isDark ? 0 : 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: border),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        shadowColor: isDark ? Colors.transparent : const Color(0x1F0F172A),
        elevation: isDark ? 0 : 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: border),
        ),
      ),
      dividerTheme: DividerThemeData(color: border, thickness: 1, space: 1),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: isDark ? background : surface,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(color: secondaryText),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(
          borderSide: BorderSide(color: primary, width: 1.5),
        ),
        errorBorder: inputBorder.copyWith(
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: inputBorder.copyWith(
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size(0, 44),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: buttonShape,
          textStyle: textTheme.labelLarge,
          elevation: 0,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size(0, 44),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: buttonShape,
          textStyle: textTheme.labelLarge,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: onSurface,
          minimumSize: const Size(0, 44),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: buttonShape,
          side: BorderSide(color: border),
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          minimumSize: const Size(0, 44),
          shape: buttonShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
    );
  }

  static TextTheme _createTextTheme(Color text, Color secondaryText) {
    return TextTheme(
      displayLarge: _textStyle(
        _displayFontFamily,
        36,
        44 / 36,
        FontWeight.w700,
        text,
        letterSpacing: -0.5,
      ),
      displayMedium: _textStyle(
        _displayFontFamily,
        28,
        34 / 28,
        FontWeight.w700,
        text,
        letterSpacing: -0.25,
      ),
      displaySmall: _textStyle(
        _displayFontFamily,
        24,
        32 / 24,
        FontWeight.w600,
        text,
        letterSpacing: -0.25,
      ),
      headlineLarge: _textStyle(
        _displayFontFamily,
        24,
        32 / 24,
        FontWeight.w600,
        text,
        letterSpacing: -0.25,
      ),
      headlineMedium: _textStyle(
        _displayFontFamily,
        20,
        28 / 20,
        FontWeight.w600,
        text,
        letterSpacing: -0.15,
      ),
      headlineSmall: _textStyle(
        _displayFontFamily,
        18,
        24 / 18,
        FontWeight.w600,
        text,
      ),
      titleLarge: _textStyle(
        _bodyFontFamily,
        16,
        24 / 16,
        FontWeight.w600,
        text,
      ),
      titleMedium: _textStyle(
        _bodyFontFamily,
        14,
        20 / 14,
        FontWeight.w600,
        text,
      ),
      titleSmall: _textStyle(
        _bodyFontFamily,
        12,
        16 / 12,
        FontWeight.w600,
        text,
      ),
      bodyLarge: _textStyle(
        _bodyFontFamily,
        16,
        24 / 16,
        FontWeight.w400,
        text,
      ),
      bodyMedium: _textStyle(
        _bodyFontFamily,
        14,
        20 / 14,
        FontWeight.w400,
        text,
      ),
      bodySmall: _textStyle(
        _bodyFontFamily,
        12,
        16 / 12,
        FontWeight.w400,
        secondaryText,
        letterSpacing: 0.1,
      ),
      labelLarge: _textStyle(
        _bodyFontFamily,
        14,
        20 / 14,
        FontWeight.w500,
        text,
        letterSpacing: 0.1,
      ),
      labelMedium: _textStyle(
        _bodyFontFamily,
        12,
        16 / 12,
        FontWeight.w500,
        text,
        letterSpacing: 0.2,
      ),
      labelSmall: _textStyle(
        _bodyFontFamily,
        11,
        14 / 11,
        FontWeight.w500,
        secondaryText,
        letterSpacing: 0.2,
      ),
    );
  }

  static TextStyle _textStyle(
    String fontFamily,
    double fontSize,
    double height,
    FontWeight fontWeight,
    Color color, {
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      height: height,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}
