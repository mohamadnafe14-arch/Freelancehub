import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freelancehub/core/theme/app_colors.dart';
import 'package:freelancehub/core/theme/app_theme.dart';
import 'package:freelancehub/main.dart';

void main() {
  group('AppTheme', () {
    test('light theme uses FreelanceHub light colors and Material 3', () {
      final theme = AppTheme.light;

      expect(theme.useMaterial3, isTrue);
      expect(theme.colorScheme.brightness, Brightness.light);
      expect(theme.colorScheme.primary, AppColors.lightPrimary);
      expect(theme.colorScheme.surface, AppColors.lightSurface);
      expect(theme.colorScheme.onSurface, AppColors.lightTextPrimary);
      expect(theme.colorScheme.onSurfaceVariant, AppColors.lightTextSecondary);
      expect(theme.scaffoldBackgroundColor, AppColors.lightBackground);
      expect(theme.textTheme.headlineLarge?.fontFamily, 'Wix Madefor Display');
      expect(AppTheme.monoTextStyle.fontFamily, 'Source Code Pro');
      expect(theme.cardTheme.shape, isA<RoundedRectangleBorder>());
    });

    test('dark theme uses FreelanceHub dark colors and Material 3', () {
      final theme = AppTheme.dark;

      expect(theme.useMaterial3, isTrue);
      expect(theme.colorScheme.brightness, Brightness.dark);
      expect(theme.colorScheme.primary, AppColors.darkPrimary);
      expect(theme.colorScheme.surface, AppColors.darkSurface);
      expect(theme.colorScheme.onSurface, AppColors.darkTextPrimary);
      expect(theme.colorScheme.onSurfaceVariant, AppColors.darkTextSecondary);
      expect(theme.scaffoldBackgroundColor, AppColors.darkBackground);
      expect(theme.cardTheme.shape, isA<RoundedRectangleBorder>());
    });

    testWidgets('app uses the system theme mode by default', (tester) async {
      await tester.pumpWidget(const MyApp());

      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));

      expect(app.themeMode, ThemeMode.system);
    });
  });
}
