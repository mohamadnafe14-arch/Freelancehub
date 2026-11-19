import 'package:flutter_test/flutter_test.dart';
import 'package:freelancehub/core/di/service_locator.dart';
import 'package:go_router/go_router.dart';

void main() {
  setUp(() async {
    await getIt.reset();
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('configuration registers a resolvable router', (tester) async {
    configureDependencies();

    expect(getIt.isRegistered<GoRouter>(), isTrue);
    expect(getIt<GoRouter>(), isA<GoRouter>());
  });

  testWidgets('repeated configuration keeps the registered router', (
    tester,
  ) async {
    configureDependencies();
    final router = getIt<GoRouter>();

    configureDependencies();

    expect(identical(getIt<GoRouter>(), router), isTrue);
  });
}
