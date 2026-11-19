import 'package:flutter_test/flutter_test.dart';
import 'package:freelancehub/core/responsive/responsive_layout.dart';
import 'package:freelancehub/core/widgets/responsive_builder.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  group('ScreenClass.fromWidth', () {
    test('classifies the approved breakpoint boundaries', () {
      expect(ScreenClass.fromWidth(360), ScreenClass.mobile);
      expect(ScreenClass.fromWidth(599), ScreenClass.mobile);
      expect(ScreenClass.fromWidth(600), ScreenClass.compactTablet);
      expect(ScreenClass.fromWidth(767), ScreenClass.compactTablet);
      expect(ScreenClass.fromWidth(768), ScreenClass.tablet);
      expect(ScreenClass.fromWidth(1023), ScreenClass.tablet);
      expect(ScreenClass.fromWidth(1024), ScreenClass.desktop);
      expect(ScreenClass.fromWidth(1439), ScreenClass.desktop);
      expect(ScreenClass.fromWidth(1440), ScreenClass.largeDesktop);
    });

    test('groups screen classes into mobile, tablet, and desktop layouts', () {
      expect(ScreenClass.mobile.isMobile, isTrue);
      expect(ScreenClass.compactTablet.isTablet, isTrue);
      expect(ScreenClass.tablet.isTablet, isTrue);
      expect(ScreenClass.desktop.isDesktop, isTrue);
      expect(ScreenClass.largeDesktop.isDesktop, isTrue);
    });
  });

  group('ResponsiveLayout', () {
    test('provides the designed content width and page padding', () {
      expect(ResponsiveLayout.maxContentWidth, 1440);
      expect(ResponsiveLayout.horizontalPagePadding(ScreenClass.mobile), 16);
      expect(
        ResponsiveLayout.horizontalPagePadding(ScreenClass.compactTablet),
        24,
      );
      expect(ResponsiveLayout.horizontalPagePadding(ScreenClass.tablet), 24);
      expect(ResponsiveLayout.horizontalPagePadding(ScreenClass.desktop), 32);
      expect(
        ResponsiveLayout.horizontalPagePadding(ScreenClass.largeDesktop),
        32,
      );
    });
  });

  testWidgets('ResponsiveBuilder uses available constraints over screen size', (
    tester,
  ) async {
    double? reportedWidth;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(size: Size(1440, 900)),
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 700,
              height: 100,
              child: ResponsiveBuilder(
                mobile: (_, _) => const SizedBox(key: ValueKey('mobile')),
                tablet: (_, width) {
                  reportedWidth = width;
                  return const SizedBox(key: ValueKey('tablet'));
                },
                desktop: (_, _) => const SizedBox(key: ValueKey('desktop')),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(const ValueKey('tablet')), findsOneWidget);
    expect(find.byKey(const ValueKey('mobile')), findsNothing);
    expect(find.byKey(const ValueKey('desktop')), findsNothing);
    expect(reportedWidth, 700);
  });
}
