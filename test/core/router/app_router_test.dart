import 'package:flutter_test/flutter_test.dart';
import 'package:freelancehub/core/router/app_router.dart';
import 'package:freelancehub/core/router/app_routes.dart';
import 'package:freelancehub/home_page.dart';
import 'package:freelancehub/main.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('initial route displays the existing home screen', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('named navigation reaches the registered home route', (
    tester,
  ) async {
    final router = createAppRouter();
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    router.goNamed(AppRouteNames.home);
    await tester.pumpAndSettle();

    expect(find.byType(MyHomePage), findsOneWidget);
    expect(router.routeInformationProvider.value.uri.path, AppRoutePaths.home);
  });

  testWidgets('unregistered future paths show the router error page', (
    tester,
  ) async {
    final router = createAppRouter(initialLocation: AppRoutePaths.clients);
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.text('Page Not Found'), findsOneWidget);
    expect(find.byType(MyHomePage), findsNothing);
  });

  testWidgets('home route is available without Firebase authentication', (
    tester,
  ) async {
    final router = createAppRouter();
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.byType(MyHomePage), findsOneWidget);
  });
}
