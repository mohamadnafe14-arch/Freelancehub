import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  if (getIt.isRegistered<GoRouter>()) {
    return;
  }

  getIt.registerSingleton<GoRouter>(
    createAppRouter(),
    dispose: (router) => router.dispose(),
  );
}
